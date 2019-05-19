#define THIS_MODULE ied
#include "x_macros.sqf"
private ["_target", "_radius", "_roads", "_road", "_ied"];

PARAMS_2(_target, _radius);

_roads = _target nearRoads _radius;

for "_i" from 1 to (floor ((count _roads) / 25) - 1) do {
    _road = _roads select (25 * _i);
    
    _ied = (GVAR(ied_type_objects) call BIS_fnc_selectRandom) createVehicle (_road modelToWorld [([3.7, -3.7] call BIS_fnc_selectRandom), 0, 0]);
    
    _ied setVariable [QGVAR(exploded), false, true];
    _ied setVariable [QGVAR(disarm), false, true];

    _ied addMPEventHandler ["MPHit", {
        [_this select 0] call FUNC(THIS_MODULE,detonate);
    }];

    [nil, nil, rExecVM, __functionRE(ied,trigger), _ied] call RE;
};