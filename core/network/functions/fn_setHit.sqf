private ["_vehicle", "_part", "_damage"];

_vehicle = _this select 0;
_part = _this select 1;
_damage = _this select 2;

_vehicle setHit [_part, _damage];

setHitGlobal = _this;
publicVariable "setHitGlobal";