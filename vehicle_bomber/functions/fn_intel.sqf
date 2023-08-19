#define THIS_MODULE vehicle_bomber
#include "x_macros.sqf"
private ["_vehicle"];

PARAMS_1(_vehicle);

if !(_vehicle getVariable QGVAR(bomber)) exitWith {};

_vehicle setVariable [QGVAR(bomber), false, true];

if (GVAR(vehicle_bomber_chance_detonate) > floor (random 100)) exitWith {
    [_vehicle] spawn FUNC(THIS_MODULE,timer);
};

sleep 5;

if !([_vehicle] call FUNC(THIS_MODULE,valid)) exitWith {
    gameLogic setVariable [QGVAR(bomber), false, true];

    sleep 2;

    [_vehicle] call FUNC(THIS_MODULE,remove);
};

if !(isNil QMODULE(mission_mini)) then {
    [] spawn FUNC(mission_mini,create);
};

sleep 2;

[_vehicle] call FUNC(THIS_MODULE,remove);