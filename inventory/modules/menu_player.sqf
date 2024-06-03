/**
 * Inventory - Menu Player Submodule
 */

#define THIS_MODULE inventory
#include "x_macros.sqf"
private ["_unit", "_actions"];

PARAMS_1(_unit);

_actions = [];

{
    private ["_name", "_key"];

    _name = _x select 0;
    _key = _x select 1;

    if ([_key, GVAR(menu_entity)] call FUNC(THIS_MODULE,valid)) then {
        [
            _actions,
            [
                format ["Inventory: Give %1", _name],
                _key
            ] call FUNC(menu,populate)
        ] call BIS_fnc_arrayPush;
    };
} forEach GVAR(inventory_types);

if ([_actions, []] call BIS_fnc_areEqual) exitWith {false};

true