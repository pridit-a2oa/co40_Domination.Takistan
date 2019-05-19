/**
 * Vehicle MHQ - Vehicle Menu Submodule
 */

#include "x_macros.sqf"
private ["_vehicle", "_deployed", "_string", "_menu", "_index"];

PARAMS_1(_vehicle);

if (GVAR(vehicle_mhq_types) find (typeOf _vehicle) == -1) exitWith {};

_menu = DIALOG("X_VEHICLE_MENU_DIALOG", 1500);

_deployed = _vehicle getVariable QGVAR(deployed);
_string = "MHQ";

if (!isNil "_deployed" && {_deployed}) then {
    _string = "Undeploy " + _string;
} else {
    _string = "Deploy " + _string;
};

_index = _menu lbAdd _string;
_menu lbSetData [_index, "mhq"];