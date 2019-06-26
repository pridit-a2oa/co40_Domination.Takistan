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
    
    _distance = GVAR(ied_trigger_distances) select 1;

    _trigger = createTrigger ["EmptyDetector", getPos _ied];
    _trigger setVariable ["ied", _ied];
    _trigger setTriggerArea [_distance, _distance, 0, true];
    _trigger setTriggerActivation ["WEST", "PRESENT", false];
    _trigger setTriggerStatements [
        "this && {[thisList, thisTrigger getVariable ""ied""] call d_fnc_ied_valid}",
        "[thisTrigger getVariable ""ied""] call d_fnc_ied_detonate",
        ""
    ];
    
    waitUntil {sleep 0.1; !alive _ied};
    
    deleteVehicle _trigger;
};