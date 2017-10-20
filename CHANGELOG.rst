Changelog
=========


(unreleased)
------------

Changes
~~~~~~~
- Update readme. [Jordan Dalton]

  Updated the readme to avoid confussion.. My bad.

Other
~~~~~
- Merge pull request #9 from TGRHavoc/develop. [Jordan Dalton]

  Fixed listener only listening on loopback address


v2.1.3 (10-10-2017)
-------------------

Fix
~~~
- Fixed listener only listening on loopback address. [Jordan Dalton]

  Caused some issues when trying to expose the sockets to the internet.. My bad.

Other
~~~~~
- Merge pull request #7 from TGRHavoc/develop. [Jordan Dalton]

  Develop


v2.1.2 (24-09-2017)
-------------------

Changes
~~~~~~~
- Update readme. [Jordan Dalton]

  Readme is now as complete as I want to make it.. It's probably going to get updated again...
- Update server comments. [Jordan Dalton]

  The server Lua files now have comments and stuff. It's probably not the best but, it'll do.

  I'm done for the day.. Time to play some games :D
- Update socketHandler (Fixes #6) [Jordan Dalton]

  I wasn't locking the client list when sending them playerData, this lead to multiple writes being completed at the same time (the playerData and playerLeft).
- Update readme. [Jordan Dalton]

  Readme now contains some more relevant information, still needs to be fully-updated though.
- Update newtonsoft package. [Jordan Dalton]

  Didn't use the PCL version of the library, this should fix any issues with it running on Linux.
- Update changelog. [Jordan Dalton]

Fix
~~~
- Fixed debugLevel.None bug. [Jordan Dalton]

  Just added an extra check to the Log function to make sure that when "LogLevel.None" is used, no logs are shown.

Other
~~~~~
- Merge branch 'hotfix/comments' into develop. [Jordan Dalton]
- Removed temporary code. [Jordan Dalton]

  Removed some code that I added to make testing easier, this includes the "kill" command and giving the player weapons when they spawn.


v2.1.1 (20-09-2017)
-------------------

Changes
~~~~~~~
- Update how players are handled. [Jordan Dalton]

  When players leave the server, they are now removed from the data and the websockets now know about it.

  Socket data is now sent by the server every .5 seconds instead of waiting for the client to send a message.

Other
~~~~~
- Add changelog. [Jordan Dalton]

  There's now a changelog! Yey


v2.1.0 (19-09-2017)
-------------------

Changes
~~~~~~~
- Update gitignore. [Jordan Dalton]
- Update blip stuff. [Jordan Dalton]

  Like a lot of shit here
  - Blips get saved when server stops
  - Blips get loaded on resource start
  - Blip coords are now rounded to 2dp
  - Blip indexes are now strings (had some issues when they were numbers.. fucking hate Lua)
  - Added some new event handlers
    - AddBlip = Adds a blip to the blips table
    - UpdateBlip = Updates a blip in the table
- Updated live_map binary. [Jordan Dalton]

  Latest compiled library from the source files.. Apparently didn't commit eariler :O
- Update readme. [Jordan Dalton]

  Changed the readme to better reflect the addon.
- Update blip generation (Fixes #3) [Jordan Dalton]

  Blips are generated from the client so, they're unique to each server :)

Fix
~~~
- Fixed Remove events not being registered. [Jordan Dalton]

  Yeah.. I kind of forgot to register them, now they can actually be used :D

Other
~~~~~
- Merge branch 'develop' [Jordan Dalton]
- Merge branch 'feature/vehicle_icons' into develop. [Jordan Dalton]
- Add vehicle icons. [Jordan Dalton]

  Player's icon now changes when they enter/exit vehicles.
- Add allow-origin header. [Jordan Dalton]

  Users can now restrict who can request the blip data via HTTP.
- Removed old files. [Jordan Dalton]

  Old files aren't needed anymore and have been removed.
- Added blip helper (Fixes #2) [Jordan Dalton]

  Technically this doesn't fix #2 but, I have added all the available blips to the UI and this. So..
- Add blips.json file (Fixes #5) [Jordan Dalton]

  Blips that are generated are now saved to a file, this file is then exposed to the web and can be gotten by HTTP requets.
- A wild license appears! [Jordan Dalton]

  Added a license to the project
- Add default client file. [Jordan Dalton]

  Added the default live_map client file.

  This keeps track of the following:
  - Player position
  - Vehicle (if in one)
  - License Plate (if in vehicle)
  - Weapon (uses a reverse hash function to get the name)
- Forgot to update __resource.lua. [Jordan Dalton]

  Shhh..
- Add reverse hash file. [Jordan Dalton]

  Added a file to make it easy to reverse a weapon's hash to get it's name. Also, something for the server owners to mess with f they want :P
- Slighly better logging. [Jordan Dalton]

  Added a "log hierarchy" so that the console doesn't get spammed with text if the user doesn't want it to.
- Add ability to remove players and data. [Jordan Dalton]

  You can now remove players or ttheir data from the object that is sent via websockets.
- FXServer Update (fixes #1) [Jordan Dalton]

  Main changes are that this version now works with FX server (only tested on 374)

  New socket server
  - Now uses the "deniszykov.WebSocketListener" library for that shiz (kinda fixes #4)


v2.0.0 (17-09-2017)
-------------------

Changes
~~~~~~~
- Update resource_manifest_version to the latest(?) one. [Jordan Dalton]

  This will allow the script to use the latest natives on the server and client

Other
~~~~~
- The start of FX compatability. [Jordan Dalton]

  Started to change the code over so that it will be compatiable with the latest FX-Server
  This means I've had to change the websocket library to one that is PCL compatiable.


v1.0.0 (24-05-2017)
-------------------

Changes
~~~~~~~
- Update websocket handler. [Jordan Dalton]

  Data sent to the websocket is now split by the space character, allows for additional arguments to be passed in case it's needed in future.
- Update readme. [Jordan Dalton]
- Update comments. [Jordan Dalton]

  My comments were wrong... They're now correct.
- Update O'Neil Ranch icon. [Jordan Dalton]

  Changed the O'Neil ranch icon to an animal instead of the jail icon
- Update to use SSL. [Jordan Dalton]
- Update lua files for SSL. [Jordan Dalton]
- Update binaries. [Jordan Dalton]

Other
~~~~~
- Add vehicle data with player data. [Jordan Dalton]

  Vehicle data is now attached to the player object and sent over websockets.
- Add resource_manifest_version. [Jordan Dalton]

  Apparently it's going to be required in future so, I'm going to add it now
- Removed file writer and console.writelines. [Jordan Dalton]

  Pretty much all the Console.WriteLine's have been changed to Debug,WriteLine and I've removed the file writer.

  The websocket server now defaults back to the insecure websocket protocol when the certificate couldn't be loaded.
- Add readme. [Jordan Dalton]

  Holy mother of... Documentation !!!
- Add utility events. [Jordan Dalton]

  Added events to allow developers to
  - Add blipss to the map
  - Add data to players (strings and floats)
- Add blip helper. [Jordan Dalton]

  "blip_helper.lua" is used to translate the blip type that GTA uses (integers) to the type the interface uses (strings).
- Add ability to add custom data to players. [Jordan Dalton]

  Making it easier to add custom data to player such as their job. Also moved from the player name being the identifier.
- Remove license. [Jordan Dalton]
- Add license and gas station blips. [Jordan Dalton]
- Remove self-signed certs. [Jordan Dalton]
- Add default SSL stuff. [Jordan Dalton]

  Secure websockets are now done over a self-signed certificate.
  If you want to use SSL properly, I suggest using your own cert.
- Add SSL support. [Jordan Dalton]
- Add lua files. [Jordan Dalton]

  Added the files for the FiveM server to interact with the live map library.
- Add clear JArrays when stopped. [Jordan Dalton]

  When the socket server is stopped, the JArrays are cleared.


v0.0.0 (21-05-2017)
-------------------
- Add C# source. [Jordan Dalton]

  Added the C# source code needed for the game server.