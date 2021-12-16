/**
 * Vehicle Loadout Module - Vehicle Submodule
 */

#define THIS_MODULE vehicle_loadout
#include "x_macros.sqf"
private ["_vehicle", "_loadout"];

PARAMS_1(_vehicle);

_loadout = ([0, GVAR(vehicle_loadout_types)] call FUNC(common,arrayValues)) find (typeOf _vehicle);

if (_loadout == -1) exitWith {};

if (isServer) then {
    [_vehicle] call FUNC(THIS_MODULE,set);
    [_vehicle] call FUNC(THIS_MODULE,rearm);
    [_vehicle] call FUNC(THIS_MODULE,arm);
};