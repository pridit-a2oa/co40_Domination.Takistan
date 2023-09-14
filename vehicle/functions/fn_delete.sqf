#include "x_macros.sqf"
private ["_vehicle"];

PARAMS_1(_vehicle);

if (isNull _vehicle) exitWith {};

if ({isPlayer _x && {alive _x}} count crew _vehicle > 0) then {
    {
        moveOut _x;
    } forEach crew _vehicle;
};

[true, "enableSimulation", [_vehicle, false]] call FUNC(network,mp);

if (!isNil QMODULE(vehicle_marker)) then {
    [true, "spawn", [[_vehicle getVariable QGVAR(id)], {
        private ["_marker"];
        
        PARAMS_1(_marker);
        
        if (isNil "_marker" || {[markerPos _marker, [0,0,0]] call BIS_fnc_areEqual}) exitWith {};
        
        deleteMarkerLocal _marker;
    }]] call FUNC(network,mp);
};

if !(isNil QMODULE(vehicle_lift)) then {
    [_vehicle] call FUNC(vehicle_lift,detach);
};

{
    _x setDamage 1;
    
    deleteVehicle _x;
} forEach crew _vehicle;

deleteVehicle _vehicle;