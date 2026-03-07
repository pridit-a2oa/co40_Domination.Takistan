#include "x_macros.sqf"
private ["_unit", "_network", "_expression"];

if !(hasInterface) exitWith {};

_unit = [_this, 0, player] call FUNC(common,param);
_network = [_this, 1, true] call FUNC(common,param);

_expression = {
    private ["_action"];

    if (isDedicated) exitWith {};
    if ([_this, player] call BIS_fnc_areEqual) exitWith {};

    if !(isNil {_this getVariable QGVAR(action)}) then {
        _this removeAction (_this getVariable QGVAR(action));
    };

    _action = GVAR(menu_player_action);
    _action set [
        0,
        format [
            "[%1] %2", "Menu" call FUNC(common,BlueText),
            name _this
        ] call FUNC(common,GreyText)
    ];

    _this setVariable [QGVAR(action), _this addAction _action];
};

switch (_network) do {
    case true: {[true, "spawn", [_unit, _expression]] call FUNC(network,mp)};
    case false: {_unit call _expression};
};