/**
 * Vehicle Bonus Module (Handler)
 */

#define THIS_MODULE vehicle_bonus
#include "x_macros.sqf"
private ["_marker", "_vehicle"];

if (isServer) then {
    for "_i" from 1 to 3 do {
        _marker = format [QGVAR(bonus_air_%1), _i];

        _vehicle = createVehicle [markerText _marker, markerPos _marker, [], 0, "NONE"];
        _vehicle setDir (markerDir _marker);
        _vehicle setPos (markerPos _marker);
        
        _vehicle setVariable [QGVAR(bonus), true, true];
        
        if (!isNil QMODULE(vehicle_respawn)) then {
            [_vehicle] __submodule(vehicle_respawn);
        };
    };
};