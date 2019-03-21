/**
 * Vehicle Bonus Module
 */

#define THIS_MODULE vehicle_bonus
#include "x_macros.sqf"
private ["_marker", "_vehicle"];

GVAR(bonus_vehicles) = [];

for "_i" from 1 to 3 do {
    _marker = format [QGVAR(bonus_air_%1), _i];

    _vehicle = createVehicle [markerText _marker, markerPos _marker, [], 0, "NONE"];
    _vehicle setDir (markerDir _marker);
    _vehicle setPos (markerPos _marker);
    
    if (!isNil QMODULE(vehicle_respawn)) then {
        [_vehicle] __submodule(vehicle_respawn);
    };
    
    // if (!isNil QMODULE(perk)) then {
    //     [_vehicle] __submodule(perk);
    // };
    
    // if (!isNil QMODULE(vehicle_wreck)) then {
    //     [_vehicle] __submodule(vehicle_wreck);
    // };
    
    GVAR(bonus_vehicles) = GVAR(bonus_vehicles) + [typeOf _vehicle];
};

MODULE(THIS_MODULE) = true;