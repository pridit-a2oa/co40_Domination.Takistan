private ["_vehicle", "_fuel"];

_vehicle = _this select 0;
_fuel = _this select 1;

if (local _vehicle) exitWith {
    _vehicle setFuel _fuel;
};

setFuelGlobal = _this;
if (isServer) exitWith {
    (owner _vehicle) publicVariableClient "setFuelGlobal";
};

publicVariableServer "setFuelGlobal";