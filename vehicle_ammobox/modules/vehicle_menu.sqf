/**
 * Vehicle Ammobox Module - Vehicle Menu Submodule
 */

#include "x_macros.sqf"
private ["_vehicle", "_menu", "_ammobox", "_string", "_index"];

PARAMS_1(_vehicle);

if (GVAR(vehicle_ammobox_types) find (typeOf _vehicle) == -1) exitWith {};

_menu = DIALOG("X_VEHICLE_MENU_DIALOG", 1500);

_ammobox = _vehicle getVariable QGVAR(ammobox);
_string = "Ammobox";

if (!isNil "_ammobox" && {_ammobox}) then {
    _string = "Unload " + _string;
} else {
    _string = "Load " + _string;

    DIALOG("X_VEHICLE_MENU_DIALOG", 1100) ctrlSetStructuredText parseText format [
        "<t size='0.8'>&#160;</t><br/><t color='#c54a30' size='1' align='left' valign='bottom'>%1</t>",
        "(!) No ammobox loaded"
    ];
};

_index = _menu lbAdd _string;
_menu lbSetData [_index, "ammobox"];