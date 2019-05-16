private ["_vehicle", "_velocity"];

_vehicle = _this select 0;
_velocity = _this select 1;

if (local _vehicle) exitWith {
    _vehicle setVelocity _velocity;
};

setVelocityGlobal = _this;
if (isServer) exitWith {
    (owner _vehicle) publicVariableClient "setVelocityGlobal";
    
    [nil, nil, "per", rSpawn, [_vehicle, _velocity], {(_this select 0) setVelocity (_this select 1)}] call RE;
};

publicVariableServer "setVelocityGlobal";