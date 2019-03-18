/**
 * Vehicle Bonus Module
 */

#define THIS_MODULE vehicle_bonus
#include "x_macros.sqf"
private ["_marker", "_vehicle"];

for "_i" from 1 to 3 do {
    _marker = format [QGVAR(bonus_air_%1), _i];

    _vehicle = createVehicle [markerText _marker, markerPos _marker, [], 0, "NONE"];
    _vehicle setDir (markerDir _marker);
    _vehicle setPos (markerPos _marker);
    
    if (!isNil QUOTE(MODULE(vehicle_respawn))) then {
        [_vehicle] __submodule(vehicle_respawn);
    };
    
    // if (!isNil QUOTE(MODULE(perk))) then {
    //     [_vehicle] __submodule(perk);
    // };
    
    // if (!isNil QUOTE(MODULE(vehicle_wreck))) then {
    //     [_vehicle] __submodule(vehicle_wreck);
    // };
};

MODULE(THIS_MODULE) = true;