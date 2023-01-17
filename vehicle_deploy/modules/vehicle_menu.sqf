/**
 * Vehicle Deploy Module - Vehicle Menu Submodule
 */

#define THIS_MODULE vehicle_deploy
#include "x_macros.sqf"
private ["_vehicle", "_type", "_deployed", "_string"];

PARAMS_1(_vehicle);

_type = [_vehicle] call FUNC(THIS_MODULE,type);

if (typeName _type == "SCALAR") exitWith {false};

_deployed = (_vehicle getVariable QGVAR(deployed)) select 0;

if (!isNil "_deployed" && {_deployed}) then {
    _string = "Undeploy " + (_type select 1);
} else {
    _string = "Deploy " + (_type select 1);
};

[
    _string,
    format ["[""deploy"", ""%1""]", toLower (_type select 1)]
] call FUNC(vehicle_menu,populate);

true