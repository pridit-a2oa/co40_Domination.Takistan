#include "x_macros.sqf"
private ["_position", "_side", "_type", "_group"];

PARAMS_3(_position, _side, _type);

_group = [_position, _side, _type] call BIS_fnc_spawnGroup;

X_JIPH setVariable [QGVAR(groups), (X_JIPH getVariable QGVAR(groups)) + [_group], true];

{
    if ([faction _x, "BIS_US"] call BIS_fnc_areEqual && {_x distance (markerPos QGVAR(base_south)) < GVAR(server_distance_base_invulnerable)}) then {
        _x addEventHandler ["HandleDamage", {0}];
    } else {
        __addDead(_x);
    };
} forEach units _group;

_group allowFleeing 0;

_group