#define THIS_MODULE vehicle_refuel
#include "x_macros.sqf"
private ["_vehicle"];

PARAMS_1(_vehicle);

if !([_vehicle] call FUNC(THIS_MODULE,valid)) exitWith {};

GVAR(refuelling) = true;

if ([[true, 2, QGVAR(sound_refuel)]] call FUNC(client,stall) && {alive _vehicle}) then {
    [_vehicle, "setFuel", 1] call FUNC(network,mp);

    if !(isNil QMODULE(inventory_refuel)) then {
        player setVariable [QGVAR(inventory_refuel), (player getVariable QGVAR(inventory_refuel)) - 1, true];
    };
};

GVAR(refuelling) = false;