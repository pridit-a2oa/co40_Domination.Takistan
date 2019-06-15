private ["_vehicle", "_on"];

_vehicle = _this select 0;
_on = _this select 1;

if (local _vehicle) exitWith {
    _vehicle engineOn _on;
};

engineOnGlobal = _this;
if (isServer) exitWith {
    (owner _vehicle) publicVariableClient "engineOnGlobal";
};

publicVariableServer "engineOnGlobal";