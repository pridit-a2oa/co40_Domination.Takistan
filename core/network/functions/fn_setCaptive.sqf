private ["_unit", "_captive"];

_unit = _this select 0;
_captive = _this select 1;

if (local _unit) exitWith {
    _unit setCaptive _captive;
};

setCaptiveGlobal = _this;
if (isServer) exitWith {
    (owner _vehicle) publicVariableClient "setCaptiveGlobal";
};

publicVariableServer "setCaptiveGlobal";