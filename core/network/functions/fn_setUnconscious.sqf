private ["_unit", "_unconscious"];

_unit = _this select 0;
_unconscious = _this select 1;

_unit setUnconscious _unconscious;

setUnconsciousGlobal = _this;
publicVariable "setUnconsciousGlobal";