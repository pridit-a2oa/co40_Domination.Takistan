#include "x_macros.sqf"
private ["_position", "_road", "_connectedRoads", "_connectedRoad", "_type", "_vehicle", "_pitchBank", "_trigger"];

PARAMS_1(_position);

_road = (_position nearRoads (GVAR(mission_mini_distance_base) select 0)) call BIS_fnc_selectRandom;

if ((markerPos QGVAR(base_south)) distance _road < (GVAR(mission_mini_distance_base) select 0)) exitWith {false};
if ((markerPos QGVAR(base_south)) distance _road > (GVAR(mission_mini_distance_base) select 1)) exitWith {false};

_connectedRoads = roadsConnectedTo _road;
_connectedRoad = if ([count _connectedRoads, 0] call BIS_fnc_areEqual) then {_road} else {_connectedRoads select 0};

_type = GVAR(mission_mini_abandoned_types_vehicle) call BIS_fnc_selectRandom;

_vehicle = _type createVehicle (getPos _road);
_vehicle setDir ([getPos _vehicle, getPos _connectedRoad] call BIS_fnc_dirTo);
_vehicle setPos (getPos _road);
_vehicle setVectorUp surfaceNormal (getPos _road);
_vehicle setFuel random (0.3);
_vehicle setDamage (random 0.4);

switch (round (random 3)) do {
    case 0: {
        _vehicle setHit ["wheel_1_1_steering", 1];
        _vehicle setHit ["wheel_1_2_steering", 1];
    };

    case 1: {
        _vehicle setHit ["wheel_1_1_steering", 1];
        _vehicle setHit ["wheel_2_1_steering", 1];
    };

    case 2: {
        _vehicle setHit ["wheel_2_1_steering", 1];
        _vehicle setHit ["wheel_2_2_steering", 1];
    };

    case 3: {
        _vehicle setHit ["wheel_1_2_steering", 1];
        _vehicle setHit ["wheel_2_1_steering", 1];
        _vehicle setHit ["wheel_2_2_steering", 1];
    };
};

if (GVAR(mission_mini_abandoned_chance_flip) > floor (random 100)) then {
    _pitchBank = _vehicle call BIS_fnc_getPitchBank;

    [_vehicle, _pitchBank select 0, (_pitchBank select 1) + 65] call BIS_fnc_setPitchBank;
};

_trigger = createTrigger ["EmptyDetector", position _road];
_trigger setVariable ["entities", []];
_trigger setVariable ["vehicle", _vehicle];
_trigger setTriggerStatements [
    "!alive (thisTrigger getVariable ""vehicle"") || {(position (thisTrigger getVariable ""vehicle"")) distance ((thisTrigger getVariable ""vehicle"") getVariable 'd_position') > 5}",
    "[thisTrigger] call d_fnc_mission_mini_complete",
    ""
];

if (!isNil QMODULE(ied) && {GVAR(mission_mini_abandoned_chance_ied) > floor (random 100)}) then {
    private ["_ied"];

    _ied = [_road] call FUNC(ied,create);

    _trigger setVariable ["entities", [_ied]];
};

if (!isNil QMODULE(vehicle)) then {
    [true, "execVM", [[_vehicle], FUNCTION(vehicle,handle)]] call FUNC(network,mp);
};

__addDead(_vehicle);

[_road, _trigger]