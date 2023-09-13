#include "x_macros.sqf"
private ["_position", "_capital", "_city", "_village", "_distances", "_distance", "_nearest"];

PARAMS_1(_position);

_capital = nearestLocation [_position, "NameCityCapital"];
_city = nearestLocation [_position, "NameCity"];
_village = nearestLocation [_position, "NameVillage"];

_distances = [
    [_capital, _position distance _capital],
    [_city, _position distance _city],
    [_village, _position distance _village]
];

_distance = ([1, _distances] call FUNC(common,arrayValues)) call BIS_fnc_lowestNum;
_nearest = ([1, _distances] call FUNC(common,arrayValues)) find _distance;

([0, _distances] call FUNC(common,arrayValues)) select _nearest