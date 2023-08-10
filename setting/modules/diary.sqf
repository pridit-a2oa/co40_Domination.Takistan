/**
 * Setting Module - Diary Submodule
 */

#include "x_macros.sqf"

["Settings", [
    "<img image='ca\missions_e\bootcamp\TE02_Tasks.Takistan\overview_ca' width='200'/>",
    "<br />Through the context menu you can access a dialog to set your personal preferences. Some of these are:<br />",
    if !(isNil QMODULE(airdrop)) then {"- Airdrop Payload"} else {""},
    if !(isNil QMODULE(respawn)) then {"- Respawn Location"} else {""},
    "- View Distance",
    "<br />To change your preferences for the mission use the context menu and select Options -> Settings.",
    if !(isNil QMODULE(profile)) then {"<br />Options with a green checkbox will <marker name=''>persist</marker> between server restarts and reconnections."} else {""},
    "<br />You will be <marker name=''>unable</marker> to change settings when unconscious or freefalling."
]] call FUNC(diary,create);