#define THIS_MODULE vote
#include "x_macros.sqf"
private ["_types"];

_types = [];

if !(isNil QMODULE(mission_main)) then {
    [_types, __submodulePP(mission_main)] call BIS_fnc_arrayPushStack;
};

[
    _types,
    [
        ["Time", [
            ["Morning", "[true, ""skipTime"", 8] call d_fnc_network_mp"],
            ["Afternoon", "[true, ""skipTime"", 12] call d_fnc_network_mp"],
            ["Evening", "[true, ""skipTime"", 18] call d_fnc_network_mp"],
            ["Night", "[true, ""skipTime"", 22] call d_fnc_network_mp"]
        ]]
    ]
] call BIS_fnc_arrayPushStack;

(_types - [])