#include "x_macros.sqf"
private ["_position", "_side", "_type"];

PARAMS_3(_position, _side, _type);

if (!isNil QMODULE(headless) && {isServer}) exitWith {
    spawnGroup = _this;
    
    (owner (X_JIPH getVariable QGVAR(headless))) publicVariableClient "spawnGroup";
};

_group = [_position, _side, _type] call BIS_fnc_spawnGroup;

{
    if (_side == east) then {
        _x setSkill 0.3;
    };
    
    __addDead(_x);
} forEach (units _group);

if (!isNil QMODULE(headless)) then {
    group = _group;
    
    publicVariableServer "group";
};

_group