#define THIS_MODULE vehicle_menu
#include "x_macros.sqf"
private ["_vehicle", "_valid"];

PARAMS_1(_vehicle);

disableSerialization;

createDialog "XD_VehicleMenuDialog";

GVAR(vehicle_dialog) = _vehicle;

DIALOG("X_VEHICLE_MENU_DIALOG", 1700) ctrlEnable false;

DIALOG("X_VEHICLE_MENU_DIALOG", 1000) ctrlSetText format ["%1 Menu", (getText (configFile >> "cfgVehicles" >> (typeOf _vehicle) >> "displayName"))];
DIALOG("X_VEHICLE_MENU_DIALOG", 1201) ctrlSetText (getText (configFile >> "cfgVehicles" >> (typeOf _vehicle) >> "picture"));

_valid = [];

if (!isNil QMODULE(inventory)) then {
    [_valid, [_vehicle] __submodulePP(inventory)] call BIS_fnc_arrayPush;
};

if (!isNil QMODULE(vehicle_ammobox)) then {
    [_valid, [_vehicle] __submodulePP(vehicle_ammobox)] call BIS_fnc_arrayPush;
};

if (!isNil QMODULE(vehicle_create)) then {
    if ((_vehicle getVariable QGVAR(deployed)) select 0) then {
        [_valid, [_vehicle] __submodulePP(vehicle_create)] call BIS_fnc_arrayPush;
    };
};

if (!isNil QMODULE(vehicle_deploy)) then {
    [_valid, [_vehicle] __submodulePP(vehicle_deploy)] call BIS_fnc_arrayPush;
};

if (!isNil QMODULE(vehicle_loadout)) then {
    [_valid, [_vehicle] __submodulePP(vehicle_loadout)] call BIS_fnc_arrayPush;
};

if (!isNil QMODULE(vehicle_teleport)) then {
    if ((_vehicle getVariable QGVAR(deployed)) select 0) then {
        [_valid, [_vehicle] __submodulePP(vehicle_teleport)] call BIS_fnc_arrayPush;
    };
};

if (!isNil QMODULE(vehicle_pack)) then {
    [_valid, [_vehicle] __submodulePP(vehicle_pack)] call BIS_fnc_arrayPush;
};

if (!isNil QMODULE(vehicle_ramp)) then {
    [_valid, [_vehicle] __submodulePP(vehicle_ramp)] call BIS_fnc_arrayPush;
};

if (!isNil QMODULE(setting)) then {
    if ((_vehicle getVariable QGVAR(deployed)) select 0) then {
        [_valid, [_vehicle] __submodulePP(setting)] call BIS_fnc_arrayPush;
    };
};

if (!isNil QMODULE(vehicle_bomber)) then {
    [_valid, [_vehicle] __submodulePP(vehicle_bomber)] call BIS_fnc_arrayPush;
};

if (!isNil QMODULE(vehicle_texture)) then {
    [_valid, [_vehicle] __submodulePP(vehicle_texture)] call BIS_fnc_arrayPush;
};

if (!isNil QMODULE(vehicle_unflip)) then {
    [_valid, [_vehicle] __submodulePP(vehicle_unflip)] call BIS_fnc_arrayPush;
};

if ({str (_x) == "false"} count _valid == count _valid) exitWith {
    DIALOG("X_VEHICLE_MENU_DIALOG", 1100) ctrlSetStructuredText parseText format [
        "<t size='0.9'>&#160;</t><br/><t size='1' align='left' valign='bottom'>%1</t>",
        "No options available"
    ];
};

lbSort (DIALOG("X_VEHICLE_MENU_DIALOG", 1500));