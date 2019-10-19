/**
 * Vehicle Ammobox Module - Vehicle Welcome Submodule
 */

#include "x_macros.sqf"
private ["_vehicle"];

PARAMS_1(_vehicle);

disableSerialization;

if (GVAR(vehicle_ammobox_types) find (typeOf _vehicle) == -1) exitWith {};

DIALOG("X_VEHICLE_WELCOME_DIALOG", 1003) ctrlSetText "\ca\ui\data\igui_sidebriefing_indep_ca";