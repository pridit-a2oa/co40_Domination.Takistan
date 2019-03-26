private ["_vehicle", "_part", "_damage"];

_vehicle = _this select 0;
_part = _this select 1;
_damage = _this select 2;

if (local _vehicle) exitWith {
    _vehicle setHit [_part, _damage];
    
    [nil, nil, rSPAWN, [_vehicle, _part, _damage], {(_this select 0) setHit [_this select 1, _this select 2]}] call RE;
};

setHitGlobal = _this;
if (isServer) exitWith {
    (owner _vehicle) publicVariableClient "setHitGlobal";
};

publicVariableServer "setHitGlobal";