/**
 * Medical Module
 *
 * Description: This module enables players to heal themselves.
 */

#define THIS_MODULE medical
#include "x_macros.sqf"

// Vehicles designated with medical capacity
GVAR(medical_type_vehicles) = [
    "HMMWV_Ambulance_DES_EP1"
];

// AddAction parameters that need to apply to existing clients & JIP
GVAR(medical_player_action) = [
    "Give Medkit" call FUNC(common,BrownText),
    FUNCTION(inventory,transfer),
    "medical",
    8,
    false,
    true,
    "",
    "['medical', _target] call d_fnc_inventory_valid && {!(_target getVariable 'd_unconscious')}"
];

if (hasInterface) then {
    GVAR(healing) = false;
};

__cppfln(FUNC(THIS_MODULE,heal),THIS_MODULE\functions\fn_heal.sqf);
__cppfln(FUNC(THIS_MODULE,valid),THIS_MODULE\functions\fn_valid.sqf);

MODULE(THIS_MODULE) = true;