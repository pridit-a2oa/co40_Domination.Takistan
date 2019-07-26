/**
 * Vehicle Bonus Module - Vehicle Submodule
 */

#define THIS_MODULE vehicle_bonus
#include "x_macros.sqf"
private ["_vehicle"];

PARAMS_1(_vehicle);

if (GVAR(vehicle_bonus_types) find (typeOf _vehicle) == -1) exitWith {};

if (isServer) then {
    if (!isNil QMODULE(vehicle_respawn)) then {
        _vehicle setVariable [QGVAR(respawnable), false, true];
    };
    
    if (isNil {_vehicle getVariable QGVAR(wreckable)}) then {
        _vehicle setVariable [QGVAR(wreckable), true, true];
    };
    
    __log format ["Variables set for %1", [typeOf _vehicle] call FUNC(vehicle,name)]];
};

if (hasInterface) then {
    if (!isNil QMODULE(perk)) then {
        [_vehicle] __submoduleVM(perk);
    };
};