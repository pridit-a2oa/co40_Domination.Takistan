private ["_vehicle", "_position"];

_vehicle = _this select 0;
_position = _this select 1;

if (local _vehicle) exitWith {
    _vehicle setVectorUp _position;
    
    [nil, nil, "per", rSPAWN, [_vehicle, _position], {(_this select 0) setVectorUp (_this select 1)}] call RE;
};

setVectorUpGlobal = _this;
if (isServer) exitWith {
    (owner _vehicle) publicVariableClient "setVectorUpGlobal";
};

publicVariableServer "setVectorUpGlobal";