#define THIS_MODULE intel
#include "x_macros.sqf"
private ["_vehicle"];

PARAMS_1(_vehicle);

deleteVehicle (driver _vehicle);
deleteVehicle _vehicle;