/**
 * Vehicle Loadout Module - Vehicle Submodule
 */

#define THIS_MODULE vehicle_loadout
#include "x_macros.sqf"
private ["_vehicle", "_loadout"];

PARAMS_1(_vehicle);

_loadout = ([0, GVAR(vehicle_loadout_types)] call FUNC(common,arrayValues)) find (typeOf _vehicle);

if ([_loadout, -1] call BIS_fnc_areEqual) exitWith {};

if (isServer) then {
    [_vehicle] call FUNC(THIS_MODULE,set);

    sleep 1 + random 1;

    [_vehicle] call FUNC(THIS_MODULE,addMagazines);

    sleep 1 + random 1;

    [_vehicle] call FUNC(THIS_MODULE,addWeapons);
};