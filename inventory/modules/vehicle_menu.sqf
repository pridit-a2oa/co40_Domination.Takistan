/**
 * Inventory - Vehicle Menu Submodule
 */

#define THIS_MODULE inventory
#include "x_macros.sqf"
private ["_vehicle", "_types"];

PARAMS_1(_vehicle);

_types = [];

{
    private ["_name", "_key"];

    _name = _x select 0;
    _key = _x select 1;

    if ([_vehicle] call (call compile format ["d_fnc_%1_%2_valid", QUOTE(THIS_MODULE), _key])) then {
        _types = _types + [[
            format ["%1: Take", _name],
            format ["%1_%2", QUOTE(THIS_MODULE), _key]
        ] call FUNC(vehicle_menu,populate)];
    };
} forEach GVAR(inventory_types);

if ([count _types, 0] call BIS_fnc_areEqual) exitWith {false};

true