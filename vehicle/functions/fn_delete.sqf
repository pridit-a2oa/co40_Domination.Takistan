#include "x_macros.sqf"
private ["_vehicle"];

PARAMS_1(_vehicle);

if ({isPlayer _x && {alive _x}} count crew _vehicle > 0) then {
    {
        moveOut _x;
    } forEach crew _vehicle;
};

if (!isNil QMODULE(vehicle_marker)) then {
    [true, "spawn", [[_vehicle getVariable QGVAR(id)], {
        private ["_marker"];
        
        PARAMS_1(_marker);
        
        if (str (markerPos _marker) == "[0,0,0]") exitWith {};
        
        deleteMarkerLocal _marker;
    }]] call FUNC(network,mp);
};

{
    deleteVehicle _x;
} forEach crew _vehicle;

deleteVehicle _vehicle;