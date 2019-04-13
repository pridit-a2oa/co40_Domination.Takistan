/**
 * Vehicle HUD - Vehicle Submodule
 */

#define THIS_MODULE vehicle_hud
#include "x_macros.sqf"
private ["_vehicle"];
PARAMS_1(_vehicle);

disableSerialization;

while {true} do {
    _attached = _vehicle getVariable QGVAR(attached);
    
    if (driver _vehicle == player) then {
        _nearest = nearestObjects [_vehicle, ["Car","Tank"], 50];
        
        if (count _nearest < 2 || {_attached}) exitWith {
            67321 cutRsc ["Default", "PLAIN"];
        };

        _nearest = _nearest select 1;
        
        67321 cutRsc ["XD_VehicleHudDialog", "PLAIN"];
        
        DIALOG("XD_VEHICLE_HUD_DIALOG", 64439) ctrlSetText (getText (configFile >> "CfgVehicles" >> typeOf _nearest >> "picture"));
    };
    
    sleep 1;
};