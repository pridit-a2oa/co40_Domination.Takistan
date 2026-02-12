/**
 * Mission Main Module - Vote Submodule
 */

#define THIS_MODULE mission_main
#include "x_macros.sqf"
private ["_options"];

if (isNil QMODULE(task) || {[X_JIPH getVariable QGVAR(tasks), []] call BIS_fnc_areEqual}) exitWith {[]};

_options = [];

{
    if ([_x select 3, "Created"] call BIS_fnc_areEqual && {[count _x, 4] call BIS_fnc_areEqual}) then {
        [
            _options,
            [
                _x select 0,
                format [
                    "[gameLogic, ""execVM"", [[""%1""], ""%2\functions\fn_skip.sqf""]] call d_fnc_network_mp",
                    _x select 0,
                    QUOTE(THIS_MODULE)
                ]
            ]
        ] call BIS_fnc_arrayPush;
    };
} forEach (X_JIPH getVariable QGVAR(tasks));

if ([_options, []] call BIS_fnc_areEqual) exitWith {[]};

[
    ["Skip Target", _options]
]