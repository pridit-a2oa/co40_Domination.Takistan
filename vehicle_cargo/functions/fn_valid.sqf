#define THIS_MODULE vehicle_cargo
#include "x_macros.sqf"
private ["_aircraft", "_filled", "_animation", "_load", "_deployed", "_distance", "_range"];

_aircraft = (player nearEntities [[GVAR(vehicle_cargo_type_aircraft)], 20]) select 0;

if (isNil "_aircraft") exitWith {false};

_filled = {[typeName _x, "STRING"] call BIS_fnc_areEqual} count ([_aircraft] call FUNC(THIS_MODULE,types));

if (_filled >= player getVariable QGVAR(vehicle_cargo)) exitWith {false};

_animation = _aircraft animationPhase "ramp_bottom";

if !([_animation, 1] call BIS_fnc_areEqual) exitWith {false};

_load = (_aircraft nearEntities [["Car", "Tank", "Truck"], 20]) select 0;

if (isNil "_load") exitWith {false};

_deployed = (_load getVariable QGVAR(deployed)) select 0;

if (_deployed) exitWith {false};

_distance = _aircraft distance _load;

if (_distance < 5) exitWith {false};

_range = (player distance _load < 15);

if (!_range) exitWith {false};

GVAR(load) = [_aircraft, _load];

true