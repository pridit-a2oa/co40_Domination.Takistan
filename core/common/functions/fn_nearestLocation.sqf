#include "x_macros.sqf"
private ["_position", "_locations", "_distances"];

PARAMS_1(_position);

_locations = [];

{
    private ["_location"];

    _location = nearestLocation [_position, _x];

    [
        _locations,
        [_location, _position distance _location]
    ] call BIS_fnc_arrayPush;
} forEach [
    "NameCity",
    "NameCityCapital",
    "NameVillage"
];

_distances = [1, _locations] call FUNC(common,arrayValues);

([0, _locations] call FUNC(common,arrayValues)) select (_distances find (_distances call BIS_fnc_lowestNum))