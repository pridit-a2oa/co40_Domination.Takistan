private ["_vehicle", "_velocity"];

_vehicle = _this select 0;
_velocity = _this select 1;

_vehicle setVelocity _velocity;

setVelocityGlobal = _this;
publicVariable "setVelocityGlobal";