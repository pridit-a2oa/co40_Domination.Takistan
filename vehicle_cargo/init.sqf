/**
 * Vehicle Cargo Module
 *
 * Description: This module enables players to load vehicles (cargo) into
 * another vehicle (e.g. aircraft) for transport or to paradrop.
 */

#define THIS_MODULE vehicle_cargo
#include "x_macros.sqf"

// Vehicles capable of containing cargo, their applicable types, and capacity
GVAR(vehicle_cargo_types) = [
    [
        "C130J_US_EP1",
        [["Car", "Tank", "Truck"], 1]
    ],

    [
        "MV22",
        [["ATV_Base_EP1", "Motorcycle"], 1]
    ]
];

// Minimum time between loading/unloading cargo
GVAR(vehicle_cargo_cooldown) = 10;

if (hasInterface) then {
    player setVariable [QGVAR(vehicle_cargo_cooldown), time + GVAR(vehicle_cargo_cooldown)];
};

__cppfln(FUNC(THIS_MODULE,action),THIS_MODULE\functions\fn_action.sqf);
__cppfln(FUNC(THIS_MODULE,entity),THIS_MODULE\functions\fn_entity.sqf);
__cppfln(FUNC(THIS_MODULE,load),THIS_MODULE\functions\fn_load.sqf);
__cppfln(FUNC(THIS_MODULE,offset),THIS_MODULE\functions\fn_offset.sqf);
__cppfln(FUNC(THIS_MODULE,unload),THIS_MODULE\functions\fn_unload.sqf);
__cppfln(FUNC(THIS_MODULE,valid),THIS_MODULE\functions\fn_valid.sqf);

MODULE(THIS_MODULE) = true;