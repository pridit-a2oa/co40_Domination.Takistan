#define THIS_MODULE vehicle_bomber
#include "x_macros.sqf"
private ["_vehicle"];

PARAMS_1(_vehicle);

if !(alive _vehicle || {!(alive (driver _vehicle))}) exitWith {};

if !(isServer) exitWith {
    [gameLogic, "execVM", [_this, __function(intel)]] call FUNC(network,mp);
};

_vehicle setVariable [QGVAR(bomber), false, true];

if (GVAR(vehicle_bomber_chance_detonate) > floor (random 100)) exitWith {
    [_vehicle] spawn FUNC(THIS_MODULE,timer);
};

sleep 5;

if !(alive _vehicle || {alive (driver _vehicle)}) exitWith {};

if !(isNil QMODULE(mission_mini)) then {
    [] spawn FUNC(mission_mini,create);
};

sleep 2;

[_vehicle] call FUNC(THIS_MODULE,remove);