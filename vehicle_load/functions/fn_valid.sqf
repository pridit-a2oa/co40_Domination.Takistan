#include "x_macros.sqf"
private ["_aircraft", "_loaded", "_nearest"];

_aircraft = (player nearEntities [[GVAR(vehicle_load_type_aircraft)], 20]) select 0;

if (isNil "_aircraft") exitWith {false};

_loaded = count (_aircraft getVariable QGVAR(loaded)) >= player getVariable QGVAR(vehicle_load);

if (_loaded) exitWith {false};

_load = (_aircraft nearEntities [["Car", "Tank", "Truck"], 20]) select 0;

if (isNil "_load") exitWith {false};

GVAR(load) = [_aircraft, _load];

true