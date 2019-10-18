/**
 * Vehicle Deploy - Vehicle Menu Submodule
 */

#define THIS_MODULE vehicle_deploy
#include "x_macros.sqf"
private ["_vehicle", "_type", "_menu", "_deployed", "_string", "_index"];

PARAMS_1(_vehicle);

_type = [_vehicle] call FUNC(THIS_MODULE,type);

if (typeName _type == "SCALAR") exitWith {};

_menu = DIALOG("X_VEHICLE_MENU_DIALOG", 1500);

_deployed = _vehicle getVariable QGVAR(deployed);

if (!isNil "_deployed" && {_deployed}) then {
    _string = "Undeploy " + (_type select 1);
} else {
    _string = "Deploy " + (_type select 1);
};

_index = _menu lbAdd _string;
_menu lbSetData [_index, toLower (_type select 1)];