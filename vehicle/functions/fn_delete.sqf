#include "x_macros.sqf"
private ["_vehicle"];

PARAMS_1(_vehicle);

{
    deleteVehicle _x;
} forEach crew _vehicle;

if (!isNil QMODULE(vehicle_marker)) then {
    [true, "deleteMarkerLocal", _vehicle getVariable QGVAR(id)] call FUNC(network,mp);
};

deleteVehicle _vehicle;