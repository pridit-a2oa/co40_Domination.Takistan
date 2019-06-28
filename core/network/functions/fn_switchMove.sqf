private ["_unit", "_move"];

_unit = _this select 0;
_move = _this select 1;

_unit switchMove _move;

switchMoveGlobal = _this;
publicVariable "switchMoveGlobal";