#include "x_macros.sqf"
private ["_vehicle", "_helper"];

PARAMS_1(_vehicle);

_helper = createVehicle ["HeliHEmpty", (getPos _vehicle), [], 0, "CAN_COLLIDE"];
_helper setDir (getDir _vehicle);
_helper setPos [(getPos _vehicle) select 0, (getPos _vehicle) select 1, 0];
_helper setVectorDirAndUp [vectorDir _vehicle, vectorUp _vehicle];

_vehicle attachTo [_helper];

_vehicle setVariable [QGVAR(helper), _helper];