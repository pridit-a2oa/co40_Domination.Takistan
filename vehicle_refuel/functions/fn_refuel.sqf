#define THIS_MODULE vehicle_refuel
#include "x_macros.sqf"
private ["_vehicle"];

PARAMS_1(_vehicle);

if !([_vehicle] call FUNC(THIS_MODULE,valid)) exitWith {};

GVAR(refuelling) = true;

if !(isNil QMODULE(inventory_fuel)) then {
    player setVariable [QGVAR(fuel_cans), (player getVariable QGVAR(fuel_cans)) - 1, true];
};

player playMove "AinvPknlMstpSlayWrflDnon_medic";

sleep 2;

if (alive player) then {
    [true, "switchMove", [player, "AinvPknlMstpSlayWrflDnon_medic"]] call FUNC(network,mp);
};

for "_i" from 1 to 2 do {
    if (!alive player) exitWith {};

    [true, "say3D", [player, QGVAR(sound_refuel), 20]] call FUNC(network,mp);

    sleep 3;

    if (!alive _vehicle || {!alive player}) exitWith {};
    
    if (_i == 2) then {
        [_vehicle, "setFuel", 1] call FUNC(network,mp);
    };
};

GVAR(refuelling) = false;