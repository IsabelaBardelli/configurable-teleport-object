# Configurable Teleport Object

Configurable Teleport Object is a script designed for creating teleportation doors in Second Life. This script allows users to set up teleportation destinations through notecards, making it easy to customize and control teleportation within your virtual environment.

## Features

- **Easy Configuration**: Teleport destinations can be easily configured through notecards, allowing you to set up teleportation points with specific coordinates and descriptions.
- **User-Friendly**: Users can simply click on the teleportation door to be instantly teleported to the specified destinations.
- **Customizable**: Customize teleportation points to match your virtual world's layout and design.
- **Versatile Usage**: Suitable for various applications, such as teleportation doors, portals, or any other interactive teleportation elements in Second Life.

## Getting Started

1. **Configuring a object**: Create a new object in Second Life and create a notecard named `teleport_destination` and add the destination in the following format:
DestinationSimName/128/128/128
This represents the destination coordinates where users will be teleported.
2. **Authorized Users Notecard**: Create a notecard named `authorized_users` and add the UUIDs of authorized users, one per line:
UUID1
UUID2
UUID3
3. **Localization Notecard**: Copy the `localization` notecard to the object, feel free to edit the messages or adjust them to your language:
titulo=Text to be changed considering variables like ${owner}
4. **Installation**: Copy the `configurable_teleport_object.lsl` script into the object's contents.

## License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

## Acknowledgements

- Thanks to the Second Life community for inspiration and support.

Feel free to contribute, report issues, or suggest improvements. Happy teleporting!
