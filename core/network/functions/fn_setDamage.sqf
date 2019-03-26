private ["_vehicle", "_damage"];

_vehicle = _this select 0;
_damage = _this select 1;

if (local _vehicle) exitWith {
    _vehicle setDamage _damage;
};

setDamageGlobal = _this;
if (isServer) exitWith {
    (owner _vehicle) publicVariableClient "setDamageGlobal";
};

publicVariableServer "setDamageGlobal";