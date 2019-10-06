#define THIS_MODULE mission_side
#include "x_macros.sqf"
private ["_position", "_mission", "_time", "_min", "_max"];

PARAMS_1(_position);

_mission = GVAR(mission_side_type_missions) call BIS_fnc_selectRandom;

if (_mission select 1 > random 100) then {
    _time = GVAR(mission_side_time_threshold);

    _min = _time select 0;
    _max = _time select 1;

    sleep (_min + round (random _max));

    [_mission select 0, _position] spawn FUNC(THIS_MODULE,create);
};