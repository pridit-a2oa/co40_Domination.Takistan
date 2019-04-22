/**
 * Vehicle Teleport - Vehicle Menu Submodule
 */

#include "x_macros.sqf"
private ["_vehicle", "_menu", "_index"];
PARAMS_2(_vehicle);

if (!isNil QMODULE(perk) && {!(player getVariable QGVAR(teleport))}) exitWith {};

_menu = DIALOG("X_VEHICLE_MENU_DIALOG", 1500);

_index = _menu lbAdd "Teleport";
_menu lbSetData [_index, "teleport"];