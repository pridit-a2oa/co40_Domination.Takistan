/**
 * Vehicle Ammobox - Vehicle Menu Submodule
 */

#include "x_macros.sqf"
private ["_vehicle", "_menu", "_ammobox", "_string", "_index"];

PARAMS_1(_vehicle);

if (GVAR(vehicle_ammobox_types) find (typeOf _vehicle) == -1) exitWith {};

_menu = DIALOG("X_VEHICLE_MENU_DIALOG", 1500);

_ammobox = _vehicle getVariable QGVAR(ammobox);
_string = "ammobox";

if (!isNil "_ammobox" && {_ammobox}) then {
    _string = "Unload " + _string;
    
    DIALOG("X_VEHICLE_MENU_DIALOG", 1202) ctrlSetTextColor [0.6, 0.5, 0.3, 1];
} else {
    _string = "Load " + _string;
};

_index = _menu lbAdd _string;
_menu lbSetData [_index, "ammobox"];