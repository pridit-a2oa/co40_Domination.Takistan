/**
 * Mission Main Module - Vote Submodule
 */

#define THIS_MODULE mission_main
#include "x_macros.sqf"
private ["_options"];

if ([X_JIP getVariable QGVAR(targets), []] call BIS_fnc_areEqual) exitWith {[]};

_options = [];

{
    private ["_name"];

    _name = _x getVariable QGVAR(name);

    [
        _options,
        [
            _name,
            format [
                "[gameLogic, ""execVM"", [[""%1""], ""%2\functions\fn_skip.sqf""]] call d_fnc_network_mp",
                _name,
                QUOTE(THIS_MODULE)
            ]
        ]
    ] call BIS_fnc_arrayPush;
} forEach (X_JIP getVariable QGVAR(targets));

if ([_options, []] call BIS_fnc_areEqual) exitWith {[]};

[
    ["Skip Target", _options]
]