#define THIS_MODULE base_rd
#include "x_macros.sqf"
private ["_trigger", "_vehicles", "_vehicle", "_progress"];

PARAMS_1(_trigger);

if (GVAR(base_rd) getVariable QGVAR(processing)) exitWith {false};

_vehicles = nearestObjects [position GVAR(base_rd), ["AllVehicles"], 10];

if (count _vehicles != 1) exitWith {false};

_vehicle = _vehicles select 0;

if (GVAR(base_rd_type_vehicles) find (typeOf _vehicle) == -1) exitWith {false};

if (!alive _vehicle) exitWith {false};
if (!simulationEnabled _vehicle) exitWith {false};
if ({alive _x} count crew _vehicle > 0) exitWith {false};

_progress = [typeOf _vehicle, "progress"] call FUNC(THIS_MODULE,item);

if (_progress select 0 >= _progress select 1) exitWith {false};

_trigger setVariable [QGVAR(vehicle), _vehicle];

true