/**
 * Base Bonus (Handler)
 */

#include "x_macros.sqf"
private ["_marker", "_name", "_vehicle"];

if (isServer) then {
    X_JIPH setVariable [QGVAR(vehicle_bonus), 0, true];
    
    for "_i" from 1 to GVAR(base_bonus_amount) do {
        _marker = format [QGVAR(bonus_air_%1), _i];
        
        if (str (markerPos _marker) == "[0,0,0]") exitWith {};

        if ([markerText _marker, "["] call KRON_StrInStr) then {
            _name = (call compile (markerText _marker)) call BIS_fnc_selectRandom;
        } else {
            _name = markerText _marker;
        };

        _vehicle = createVehicle [_name, markerPos _marker, [], 0, "NONE"];
        _vehicle setDir (markerDir _marker);
        _vehicle setPosATL [(getPosATL _vehicle) select 0, (getPosATL _vehicle) select 1, 0];
        
        if (!isNil QMODULE(vehicle_respawn)) then {
            _vehicle setVariable [QGVAR(respawnable), false, true];
        };
        
        if (!isNil QMODULE(vehicle_wreck)) then {
            _vehicle setVariable [QGVAR(wreckable), true, true];
        };
        
        X_JIPH setVariable [QGVAR(vehicle_bonus), (X_JIPH getVariable QGVAR(vehicle_bonus)) + 1, true];
    };
};