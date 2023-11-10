/*
*   Created by Isabela Evergaden
*   https://my.secondlife.com/isabela.evergarden
*   
*/

// finals
string PROPERTY_FILE = "lock.properties";
list PROPERTIES_LIST = ["teleport.destination", "security.user.add", "localization.q1", "localization.locked", "localization.2locked", "localization.open"];
integer VERBOSE = FALSE;

float VOLUME = 1.0;

// system variables
vector teleportDest;
list authorizedUsers;

// i18nMap
list configKeys;
list configValues;

// prop reader utils
key kQuery;
integer iLine = 0;
integer iStep = 0;


// methods utils
addToConfigMap(string k, string value) {
    integer index = llListFindList(configKeys, [k]);
    if (index > -1) {
        configKeys = llDeleteSubList(configKeys, index, index);
        configValues = llDeleteSubList(configValues, index, index);
    }
    configKeys += llStringTrim(k, STRING_TRIM);
    configValues += llStringTrim(value, STRING_TRIM);
}

string getFromConfig(string k) {
    integer index = llListFindList(configKeys, [k]);
    if (index > -1) return llList2String(configValues, index);
    else return "null";
}

setToConfigMap(string data) {
    integer i = 0;
    for (i = 0; i < llGetListLength(PROPERTIES_LIST); i++) {
        string dtElem = llList2String(PROPERTIES_LIST, i);
        if (llSubStringIndex(data, dtElem) > -1) {
            string k = dtElem;
            string v = replaceString(data, dtElem+"=", "");
            
            if (VERBOSE) llOwnerSay("Properties: " + k + "= " + v + ";");

            if (k == "teleport.destination") teleportDest = (vector) v;
            else if (k == "security.user.add") authorizedUsers += v;
            else addToConfigMap(k, v);
        }
    }
}

string replaceString(string source, string pattern, string replace) {
    while (llSubStringIndex(source, pattern) > -1) {
        integer len = llStringLength(pattern);
        integer pos = llSubStringIndex(source, pattern);
        if (llStringLength(source) == len) { source = replace; }
        else if (pos == 0) { source = replace+llGetSubString(source, pos+len, -1); }
        else if (pos == llStringLength(source)-len) { source = llGetSubString(source, 0, pos-1)+replace; }
        else { source = llGetSubString(source, 0, pos-1)+replace+llGetSubString(source, pos+len, -1); }
    }
    return source;
}

default
{
    state_entry()
    {
        key nc_key = llGetInventoryKey(PROPERTY_FILE);
        if (nc_key != NULL_KEY) kQuery = llGetNotecardLine(PROPERTY_FILE, iLine); 
    }

    dataserver(key query_id, string data) 
    {
        if (query_id == kQuery) 
        {
            if (data == EOF) {
                iLine = 0;
                return;
            } else {   
                setToConfigMap(data);
                kQuery = llGetNotecardLine(PROPERTY_FILE, ++iLine);
            }
        }
    }

    touch_start(integer total_number)
    {
         // cute name
        string userCuteName = llDetectedName(0);
        key userUUID = llDetectedKey(0);
        //string userUglyname = llKey2Name(userUUID);
        string userUglyName = llGetUsername(userUUID);
        string firstName = llList2String(llParseString2List(userCuteName, [" "], []), 0);

        integer index = llListFindList(authorizedUsers, [userUglyName]);

        if (index > -1) {
            llWhisper(PUBLIC_CHANNEL, replaceString(getFromConfig("localization.open"), "${user}", firstName));
            if (llGetPermissions() & PERMISSION_TELEPORT) llTeleportAgent(userUUID, "", teleportDest, ZERO_VECTOR);
            else llRequestPermissions(userUUID, PERMISSION_TELEPORT);
        } else {
            llWhisper(PUBLIC_CHANNEL, replaceString(getFromConfig("localization.locked"), "${user}", firstName));
            llWhisper(PUBLIC_CHANNEL, replaceString(getFromConfig("localization.2locked"), "${user}", firstName));
        }
    }

    changed(integer change)
    {
        if (change & CHANGED_INVENTORY) 
        {
            llResetScript();
        }
    }

    run_time_permissions(integer permissions)
    {
        if (permissions & PERMISSION_TELEPORT) {
           if (VERBOSE) llOwnerSay("Tp Granted");
        }
    }
}