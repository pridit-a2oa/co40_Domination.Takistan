#define THIS_MODULE vehicle_menu
#include "x_macros.sqf"
#define __ctrl(vctrl) _ctrl = _XD_display displayCtrl vctrl
#define __ctrl2(ectrl) (_XD_display displayCtrl ectrl)
private ["_vehicle"];
PARAMS_1(_vehicle);

disableSerialization;

createDialog "XD_VehicleMenuDialog";

_XD_display = uiNamespace getVariable "X_VEHICLE_MENU_DIALOG";

GVAR(vehicle_dialog) = _vehicle;

__ctrl2(1000) ctrlSetText (getText (configFile >> "cfgVehicles" >> (typeOf _vehicle) >> "displayName"));
__ctrl2(1201) ctrlSetText (getText (configFile >> "cfgVehicles" >> (typeOf _vehicle) >> "picture"));
__ctrl2(1202) ctrlSetText (getText (configFile >> "cfgVehicles" >> "USVehicleBox_EP1" >> "icon"));

if (!isNil QMODULE(vehicle_mhq)) then {
    [_vehicle, _XD_display] __submodule(vehicle_mhq);
};

if (!isNil QMODULE(vehicle_ammobox)) then {
    [_vehicle, _XD_display] __submodule(vehicle_ammobox);
};

if (!isNil QMODULE(vehicle_create)) then {
    if (_vehicle getVariable QGVAR(deployed)) then {
        [_vehicle, _XD_display] __submodule(vehicle_create);
    };
};