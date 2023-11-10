# Configurable Teleport Object

Configurable Teleport Object is a script designed for creating teleportation doors in Second Life. This script allows users to set up teleportation destinations through notecards, making it easy to customize and control teleportation within your virtual environment.

## Features

- **Easy Configuration**: Teleport destinations can be easily configured through notecards, allowing you to set up teleportation points with specific coordinates and descriptions.
- **User-Friendly**: Users can simply click on the teleportation door to be instantly teleported to the specified destinations.
- **Customizable**: Customize teleportation points to match your virtual world's layout and design.
- **Versatile Usage**: Suitable for various applications, such as teleportation doors, portals, or any other interactive teleportation elements in Second Life.

## Getting Started

1. **Configuring**: Copy the `lock.properties` notecard to the object, feel free to edit the messages or adjust them to your language:
teleport.destination=<145,217,3501>
security.user.add=isabela.evergarden
localization.locked=${user} tried to open the door...
localization.2locked="I won't be able to open it without a key" ${user} thinks.
localization.open=${user} unlocks the door...
security.user.add=anyuser.youwant

2. **Security**: Using the tag `security.user.add` you can give permission to how many users you want (one per line)
This represents the destination coordinates where users will be teleported.

3. `teleport.destination=<145,217,3501>` represents the position you want to move to.


## License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

## Acknowledgements

- Thanks to the Second Life community for inspiration and support.

Feel free to contribute, report issues, or suggest improvements. Happy teleporting!
