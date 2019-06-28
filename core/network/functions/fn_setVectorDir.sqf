private ["_vehicle", "_vector"];

_vehicle = _this select 0;
_vector = _this select 1;

_vehicle setVectorDir _vector;

setVectorDirGlobal = _this;
publicVariable "setVectorDirGlobal";