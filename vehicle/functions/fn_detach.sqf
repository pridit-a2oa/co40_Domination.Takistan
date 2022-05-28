#include "x_macros.sqf"
private ["_vehicle"];

PARAMS_1(_vehicle);

detach _vehicle;

deleteVehicle (_vehicle getVariable QGVAR(helper));