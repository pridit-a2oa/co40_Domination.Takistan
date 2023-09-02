#define THIS_MODULE vehicle_lift
#include "x_macros.sqf"
private ["_lifter", "_type", "_nearest"];

_lifter = _this select 0;

if !(isNull (_lifter getVariable QGVAR(attached))) exitWith {false};
if (hasInterface && {!([player, driver _lifter] call BIS_fnc_areEqual)}) exitWith {false};

if (speed _lifter > GVAR(vehicle_lift_speed)) exitWith {false};
if ((position _lifter) select 2 > GVAR(vehicle_lift_distance)) exitWith {false};

_type = call FUNC(THIS_MODULE,type);

_nearest = (nearestObjects [position _lifter, _type select 0, GVAR(vehicle_lift_distance)]) - [_lifter];

if ([_nearest, []] call BIS_fnc_areEqual) exitWith {false};

_nearest = _nearest select 0;

if (locked _nearest) exitWith {false};
if (_nearest isKindOf "StaticWeapon") exitWith {false};
if ({alive _x && {!isPlayer _x}} count crew _nearest > 0) exitWith {false};
if (alive _nearest && {(vectorUp _nearest) select 2 < 0.6}) exitWith {false};
if !([alive _nearest, _type select 1] call BIS_fnc_areEqual) exitWith {false};

_nearest