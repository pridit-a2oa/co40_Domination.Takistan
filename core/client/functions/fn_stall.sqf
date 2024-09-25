#include "x_macros.sqf"
private ["_iterative", "_move", "_unit"];

_iterative = [_this, 0, [false]] call FUNC(common,param);
_move = [_this, 1, ["AinvPknlMstpSlayWrflDnon_medic", ""]] call FUNC(common,param);
_unit = [_this, 2, player] call FUNC(common,param);

player setVariable [QGVAR(idle), false];

_unit playMove (_move select 0);

sleep 2;

if !([] call FUNC(common,ready)) exitWith {
    player setVariable [QGVAR(idle), true];

    false
};

[true, "switchMove", [_unit, _move select 0]] call FUNC(network,mp);

switch (_iterative select 0) do {
    case true: {
        for "_i" from 1 to (_iterative select 1) do {
            if !([_iterative select 2, ""] call BIS_fnc_areEqual) then {
                [true, "say3D", [_unit, _iterative select 2, 20]] call FUNC(network,mp);
            };

            sleep 3;

            if !([] call FUNC(common,ready)) exitWith {};
        };
    };

    case false: {
        sleep 5;
    };
};

if !([_move select 1, ""] call BIS_fnc_areEqual) then {
    [true, "playMoveNow", [_unit, _move select 1]] call FUNC(network,mp);
};

if !([] call FUNC(common,ready)) exitWith {
    player setVariable [QGVAR(idle), true];

    false
};

player setVariable [QGVAR(idle), true];

true