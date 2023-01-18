#include "x_macros.sqf"
private ["_mission", "_position"];

PARAMS_2(_mission, _position);

_handle = format ["mission_side\missions\%1", _mission];

__handlerVM(_handle);