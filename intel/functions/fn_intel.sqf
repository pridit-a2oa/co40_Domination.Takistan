#define THIS_MODULE intel
#include "x_macros.sqf"
private ["_vehicle"];

PARAMS_1(_vehicle);

if !(isServer) exitWith {
    [gameLogic, "execVM", [_this, __function(intel)]] call FUNC(network,mp);
};

_vehicle setVariable [QGVAR(intel), false, true];

if (GVAR(intel_chance_bomb) > floor (random 100)) exitWith {
    // Remove killed handler for deducting points, as its not a civilian
    [_vehicle] spawn FUNC(THIS_MODULE,timer);
};

sleep 5;

if (!isNil QMODULE(mission_mini) && {alive _vehicle} && {alive (driver _vehicle)}) then {
    ["intel"] spawn FUNC(mission_mini,create);
};

sleep 2;

[_vehicle] call FUNC(THIS_MODULE,remove);