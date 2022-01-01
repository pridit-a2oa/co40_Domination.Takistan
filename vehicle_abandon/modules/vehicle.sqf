/**
 * Vehicle Abandon Module - Vehicle Submodule
 */

#include "x_macros.sqf"
private ["_vehicle"];

PARAMS_1(_vehicle);

if (isNil {_vehicle getVariable QGVAR(abandon)} && {((faction _vehicle) in ["BIS_TK", "BIS_TK_INS"])}) then {
    _vehicle setVariable [QGVAR(abandon), true];
};