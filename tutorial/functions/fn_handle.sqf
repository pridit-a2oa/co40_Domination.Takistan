#define THIS_MODULE tutorial
#include "x_macros.sqf"
private ["_sequences"];

disableSerialization;

if (isNil QMODULE(setting) || {(player getVariable QGVAR(tutorial)) select 1 == 0}) exitWith {
    GVAR(tutorial) = false;
};

0 spawn {
    while {GVAR(tutorial)} do {
        waitUntil {sleep 0.1; !isNull (findDisplay 49)};

        if !(GVAR(tutorial)) exitWith {};

        _ctrl = (findDisplay 49) displayCtrl 1010;
        _ctrl ctrlEnable false;
    };
};

_sequences = [
    [
        [8273.95,2107.88,0],
        [-20,17,4],
        "<t color='#5398b6'>Fast Travel</t><br />Teleport or HALO jump via the flag"
    ]
];

if !(isNil QMODULE(base_ammobox)) then {
    [_sequences, __submodulePP(base_ammobox)] call BIS_fnc_arrayPush;
};

if !(isNil QMODULE(base_rd)) then {
    [_sequences, __submodulePP(base_rd)] call BIS_fnc_arrayPush;
};

if !(isNil QMODULE(base_wreck)) then {
    [_sequences, __submodulePP(base_wreck)] call BIS_fnc_arrayPush;
};

[_sequences] spawn FUNC(THIS_MODULE,play);