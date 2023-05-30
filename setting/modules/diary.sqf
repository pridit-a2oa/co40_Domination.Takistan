/**
 * Setting Module - Diary Submodule
 */

#include "x_macros.sqf"

["Settings", [
    "<img image='ca\missions_e\bootcamp\TE02_Tasks.Takistan\overview_ca' width='200'/><br />",
    "Through the context menu you can access a dialog to set your personal preferences. These include:<br />",
    if !(isNil QMODULE(airdrop)) then {"- Airdrop Payload"} else {""},
    if !(isNil QMODULE(revive)) then {"- Respawn Location"} else {""},
    "- View Distance<br />",
    "To change these and more scroll down to <marker name=''>Options</marker> then <marker name=''>Settings</marker>.<br />",
    if !(isNil QMODULE(profile)) then {"Options with a green checkbox will <marker name=''>persist</marker> between server restarts and reconnections.<br />"} else {""},
    "You will be <marker name=''>unable</marker> to change settings when unconscious or freefalling."
]] call FUNC(diary,create);