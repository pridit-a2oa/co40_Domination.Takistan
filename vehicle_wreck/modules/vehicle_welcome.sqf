/**
 * Vehicle Wreck - Vehicle Welcome Submodule
 */

#include "x_macros.sqf"
private ["_vehicle"];

PARAMS_1(_vehicle);

disableSerialization;

if (GVAR(vehicle_wreck_type_lifts) find (typeOf _vehicle) == -1) exitWith {};

DIALOG("X_VEHICLE_WELCOME_DIALOG", 1005) ctrlSetText "\ca\ui\data\igui_sidebriefing_indep_ca";