#define THIS_MODULE ied
#include "x_macros.sqf"
private ["_target", "_ied", "_roads"];

PARAMS_1(_target);

// To do: refactor once main targets are in, probably just a relPos with a
// predetermined radius

_ied = GVAR(ied_type_objects) call BIS_fnc_selectRandom;

_roads = _target nearRoads 30;

{
    _ied = (GVAR(ied_type_objects) call BIS_fnc_selectRandom) createVehicle (_x modelToWorld [([3.7, -3.7] call BIS_fnc_selectRandom), 0, 0]);
    
    _ied setVariable [QGVAR(exploded), false, true];
    _ied setVariable [QGVAR(disarm), false, true];
    
    _ied addMPEventHandler ["MPHit", {
        [_this select 0] call FUNC(THIS_MODULE,detonate);
    }];
    
    [nil, nil, rExecVM, __functionRE(ied,trigger), _ied] call RE;
} forEach _roads;