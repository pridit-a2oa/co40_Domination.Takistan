/**
 * Menu - Player Module (Handler)
 */

#include "x_macros.sqf"

if (hasInterface) then {
    [true, "spawn", [[player], {
        private ["_unit", "_action"];

        PARAMS_1(_unit);

        if (isDedicated) exitWith {};

        _action = GVAR(menu_player_action);
        _action set [
            0,
            format [
                "[%1] %2", "Menu" call FUNC(common,BlueText),
                name _unit
            ] call FUNC(common,GreyText)
        ];

        _unit addAction _action;
    }]] call FUNC(network,mp);
};