private ["_unit", "_move"];

_unit = _this select 0;
_move = _this select 1;

if (local _unit) exitWith {
    _unit switchMove _move;
    
    [nil, nil, rSpawn, [_unit, _move], {(_this select 0) switchMove (_this select 1)}] call RE;
};

switchMoveGlobal = _this;
if (isServer) exitWith {
    (owner _unit) publicVariableClient "switchMoveGlobal";
};

publicVariableServer "switchMoveGlobal";