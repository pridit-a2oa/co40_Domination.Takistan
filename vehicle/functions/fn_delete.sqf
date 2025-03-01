#include "x_macros.sqf"
private ["_vehicle"];

PARAMS_1(_vehicle);

if (isNull _vehicle) exitWith {};

if ({isPlayer _x} count crew _vehicle > 0) then {
    {
        if (!isNil QMODULE(vehicle_uav) && {typeOf _vehicle in GVAR(vehicle_uav_types)}) then {
            [_x, "execVM", [[_vehicle, false], FUNCTION(vehicle_uav,control)]] call FUNC(network,mp);
        } else {
            moveOut _x;
        };
    } forEach crew _vehicle;

    waitUntil {sleep 0.1; [{isPlayer _x} count crew _vehicle, 0] call BIS_fnc_areEqual};
};

[true, "enableSimulation", [_vehicle, false]] call FUNC(network,mp);

if !(isNil QMODULE(vehicle_marker)) then {
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
    if !(isPlayer _x) then {
        _x setDamage 1;

        deleteVehicle _x;
    };
} forEach crew _vehicle;

deleteVehicle _vehicle;