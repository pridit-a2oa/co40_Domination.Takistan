private ["_vehicle", "_position"];

_vehicle = _this select 0;
_position = _this select 1;

_vehicle setVectorUp _position;

setVectorUpGlobal = _this;
publicVariable "setVectorUpGlobal";