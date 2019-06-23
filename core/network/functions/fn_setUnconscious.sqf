private ["_unit", "_unconscious"];

_unit = _this select 0;
_unconscious = _this select 1;

if (local _unit) exitWith {
    _unit setUnconscious _unconscious;
    
    [nil, nil, rSpawn, [_unit, _unconscious], {(_this select 0) setUnconscious (_this select 1)}] call RE;
};

setUnconsciousGlobal = _this;
if (isServer) exitWith {
    (owner _unit) publicVariableClient "setUnconsciousGlobal";
};

publicVariableServer "setUnconsciousGlobal";