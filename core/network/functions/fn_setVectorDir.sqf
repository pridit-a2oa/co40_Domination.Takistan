private ["_vehicle", "_vector"];

_vehicle = _this select 0;
_vector = _this select 1;

if (local _vehicle) exitWith {
    _vehicle setVectorDir _vector;
};

setVectorDirGlobal = _this;
if (isServer) exitWith {
    (owner _vehicle) publicVariableClient "setVectorDirGlobal";
    
    [nil, nil, "per", rSpawn, [_vehicle, _vector], {(_this select 0) setVectorDir (_this select 1)}] call RE;
};

publicVariableServer "setVectorDirGlobal";