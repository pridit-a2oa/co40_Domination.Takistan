/**
 * Accolade Module - Unit Menu Submodule
 */

#define THIS_MODULE accolade
#include "x_macros.sqf"
private ["_unit"];

PARAMS_1(_unit);

if ([player getVariable QGVAR(tasks), []] call BIS_fnc_areEqual) exitWith {false};

{
    if ([typeOf _unit, _x select 2] call BIS_fnc_areEqual) then {
        [
            format [
                "Tasks: %1",
                _x select 1
            ],
            format ["[""accolade"", ""%1""]", _x select 0]
        ] call FUNC(menu,populate);
    };
} forEach GVAR(accolade_types);

true