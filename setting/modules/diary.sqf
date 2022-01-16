/**
 * Setting Module - Diary Submodule
 */

#include "x_macros.sqf"

["Settings", [
    "<img image='ca\missions_e\bootcamp\TE02_Tasks.Takistan\overview_ca' width='200'/><br />",
    "Through the <marker name=''>context menu</marker> you can access a dialog to set your preferences for the mission.<br />",
    format [
        "These include things such as %1%2view distance, so are important to change.<br />",
        if (!isNil QMODULE(airdrop)) then {"airdrop payload, "} else {""},
        if (!isNil QMODULE(revive)) then {"respawn location, and "} else {""}
    ],
    "To change your settings use the <marker name=''>context menu</marker> and scroll down to <marker name=''>Options</marker> then <marker name=''>Settings</marker>.<br />",
    "You will be <marker name=''>unable</marker> to change settings when unconscious or freefalling."
]] call FUNC(diary,create);