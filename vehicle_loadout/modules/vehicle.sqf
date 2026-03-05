/**
 * Vehicle Loadout Module - Vehicle Submodule
 */

#define THIS_MODULE vehicle_loadout
#include "x_macros.sqf"
private ["_vehicle"];

PARAMS_1(_vehicle);

if !(typeOf _vehicle in ([0, GVAR(vehicle_loadout_types)] call FUNC(common,arrayValues))) exitWith {};

if (isServer) then {
    waitUntil {sleep 0.1; isNil {serverNamespace getVariable QGVAR(vehicle_loadout)}};

    serverNamespace setVariable [QGVAR(vehicle_loadout), true];

    [_vehicle] call FUNC(THIS_MODULE,set);

    sleep 0.5;

    [_vehicle] call FUNC(THIS_MODULE,addMagazines);

    sleep 0.5;

    [_vehicle] call FUNC(THIS_MODULE,addWeapons);

    serverNamespace setVariable [QGVAR(vehicle_loadout), nil];
};