#include "x_macros.sqf"
private ["_unit", "_amount", "_reason"];

PARAMS_3(_unit, _amount, _reason);

if (isServer) exitWith {
    _unit addScore _amount;

    [_unit, "systemChat", format [
        "You have been given %1 score for %2",
        _amount,
        _reason
    ]] call FUNC(network,mp);

    [_unit, "playSound", "beep"] call FUNC(network,mp);
};

[gameLogic, "addScore", [_unit, _amount]] call FUNC(network,mp);

systemChat format [
    "You have been given %1 score for %2",
    _amount,
    _reason
];

playSound "beep";