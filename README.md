windows wifi
============

*works on windows xp to windows 8*

A simple script for running netsh command in windows. Just unpack and run the bat file.

Running this script shall ask for administrator rights, give it. It's safe. Every second program in windows ask for it.
The device on which the network is created might not appear to be connected to any wireless network. It's okay.

**How to share internet over this network?**

1. Go to network sharing center.
2. Choose Manage wireless adapters from the left panel.
3. Note that a new adapter with text "Virtual hosted network adapter" shall be created ending in some *<number>
3. Right click on the adapter with working internet(e.g. Local area connection)
4. Choose properties and go to sharing tab.
5. Select the first option and uncheck the second one.
6. From the drop down, choose the newly created hosted network( the one in #3), and select ok.

*Connected devices might need to re-connect to the network after the above steps*
