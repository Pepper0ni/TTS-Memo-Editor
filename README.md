# TTS-Memo-Editor
A script that, when added to a tile, will allow a user to log object data and easilly edit the memo of objects.

For the unaware, memos are a string within objects that does nothing, intended to be used by other scripts as a place to save script specific data. However there is no way to edit it outside of script, which can cause issues for modders whose objects have malformed memos, or for anyone who needs to set it manually for whatever reason. This tool addresses that problem.

To use the editor, place the object you are editing on the tile, use the get button if you want to see the current memo (it will appear in the input box), edit it as desired, then click set memo to set that memo to every object on the tile.

Additionally I have included a button to log the object's data, printing it to the console, and a button that allows you to easilly clear an object's script_state, a variable used to store data within the object when saving and loading, in case that is in a malformed state.
