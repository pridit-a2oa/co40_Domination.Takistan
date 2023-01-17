/**
 * Vehicle Ammobox Module - Vehicle Menu Submodule
 */

#include "x_macros.sqf"
private ["_vehicle", "_ammobox", "_string"];

PARAMS_1(_vehicle);

if (GVAR(vehicle_ammobox_types) find (typeOf _vehicle) == -1) exitWith {false};

_ammobox = _vehicle getVariable QGVAR(ammobox);
_string = "Ammobox";

if (!isNil "_ammobox" && {_ammobox}) then {
    _string = "Unload " + _string;
} else {
    _string = "Load " + _string;

    DIALOG("X_VEHICLE_MENU_DIALOG", 1100) ctrlSetStructuredText parseText format [
        "<t size='0.9'>&#160;</t><br/><t color='#c54a30' size='1' align='left' valign='bottom'>%1</t>",
        "(!) No ammobox loaded"
    ];
};

[_string, "ammobox"] call FUNC(vehicle_menu,populate);

true