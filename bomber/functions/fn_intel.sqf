#define THIS_MODULE bomber
#include "x_macros.sqf"
private ["_vehicle"];

PARAMS_1(_vehicle);

if !(isServer) exitWith {
    [gameLogic, "execVM", [_this, __function(intel)]] call FUNC(network,mp);
};

_vehicle setVariable [QGVAR(bomber), false, true];

if (GVAR(bomber_chance_detonate) > floor (random 100)) exitWith {
    // TODO: Remove killed handler for deducting points, as its not a civilian
    [_vehicle] spawn FUNC(THIS_MODULE,timer);
};

sleep 5;

if (!isNil QMODULE(mission_mini) && {alive _vehicle} && {alive (driver _vehicle)}) then {
    [] spawn FUNC(mission_mini,create);
};

sleep 2;

[_vehicle] call FUNC(THIS_MODULE,remove);