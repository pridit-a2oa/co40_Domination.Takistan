/**
 * Base Bonus (Handler)
 */

#include "x_macros.sqf"

if (isServer) then {
    for "_i" from 1 to GVAR(base_bonus_amount) do {
        private ["_marker", "_name", "_vehicle"];

        _marker = format [QGVAR(base_bonus_%1), _i];
        
        if ([markerPos _marker, [0,0,0]] call BIS_fnc_areEqual) exitWith {};

        if ([markerText _marker, "["] call KRON_StrInStr) then {
            _name = (call compile (markerText _marker)) call BIS_fnc_selectRandom;
        } else {
            _name = markerText _marker;
        };

        _vehicle = createVehicle [_name, markerPos _marker, [], 0, "NONE"];
        _vehicle setDir (markerDir _marker);
        _vehicle setPosATL [(getPosATL _vehicle) select 0, (getPosATL _vehicle) select 1, 0];
        
        if !(isNil QMODULE(vehicle_respawn)) then {
            _vehicle setVariable [QGVAR(respawnable), false, true];
        };
        
        if !(isNil QMODULE(vehicle_wreck)) then {
            _vehicle setVariable [QGVAR(wreckable), true, true];
        };
    };

    X_JIPH setVariable [QGVAR(base_bonus), true, true];
};