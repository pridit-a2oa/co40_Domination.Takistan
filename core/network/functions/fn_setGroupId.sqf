private ["_unit", "_group"];

_unit = _this select 0;
_group = _this select 1;

if (local _unit) then {
    _unit setGroupId [_group];
};

setGroupIdGlobal = _this;
if (isServer) exitWith {
    (owner _unit) publicVariableClient "setGroupIdGlobal";
};

publicVariableServer "setGroupIdGlobal";