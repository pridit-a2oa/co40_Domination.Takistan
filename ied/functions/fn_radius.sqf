#define THIS_MODULE ied
#include "x_macros.sqf"
private ["_position", "_radius", "_spots", "_roads", "_ieds"];

PARAMS_2(_position, _radius);

_spots = [_position, _radius] call FUNC(server,nearRoads);

_roads = [];

for "_i" from 1 to (floor ((count _spots) / 10) - 1) do {
    [_roads, _spots select (10 * _i)] call BIS_fnc_arrayPush;
};

_ieds = [];

while {count _roads > 0} do {
    private ["_road"];

    if ([count _ieds, GVAR(ied_amount_limit)] call BIS_fnc_areEqual) exitWith {};

    _road = _roads call BIS_fnc_selectRandom;

    if ([nearestObjects [_road, GVAR(ied_type_objects), GVAR(ied_distance_identical)], []] call BIS_fnc_areEqual) then {
        [_ieds, [_road] call FUNC(THIS_MODULE,create)] call BIS_fnc_arrayPush;

        sleep 0.5;
    };

    _roads = _roads - [_road];

    sleep 0.1;
};

_ieds