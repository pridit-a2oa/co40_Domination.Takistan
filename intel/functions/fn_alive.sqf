#include "x_macros.sqf"
private ["_driver", "_vehicle"];

PARAMS_2(_driver, _vehicle);

if (!alive _driver) exitWith {false};
if (!alive _vehicle) exitWith {false};
if (!canMove _vehicle) exitWith {false};
if (!([_vehicle] call FUNC(common,canMove))) exitWith {false};

true