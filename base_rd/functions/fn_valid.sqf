#define THIS_MODULE base_rd
#include "x_macros.sqf"
private ["_trigger", "_vehicle", "_progress"];

PARAMS_1(_trigger);

if (GVAR(base_rd) getVariable QGVAR(processing)) exitWith {false};

_vehicle = (nearestObjects [position GVAR(base_rd), GVAR(base_rd_type_vehicles), 10]) select 0;

if (isNil "_vehicle") exitWith {false};
if (!alive _vehicle) exitWith {false};
if (!simulationEnabled _vehicle) exitWith {false};
if ({alive _x} count crew _vehicle > 0) exitWith {false};
if ({_x distance GVAR(base_rd) < 10} count (call FUNC(common,players)) > 0) exitWith {false};

_progress = [typeOf _vehicle, "progress"] call FUNC(THIS_MODULE,item);

if (_progress select 0 >= _progress select 1) exitWith {false};

_trigger setVariable [QGVAR(vehicle), _vehicle];

true