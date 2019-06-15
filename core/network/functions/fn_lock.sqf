private ["_vehicle", "_lock"];

_vehicle = _this select 0;
_lock = _this select 1;

if (local _vehicle) exitWith {
    _vehicle lock _lock;
};

lockGlobal = _this;
if (isServer) exitWith {
    (owner _vehicle) publicVariableClient "lockGlobal";
};

publicVariableServer "lockGlobal";