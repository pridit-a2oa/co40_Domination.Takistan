/**
 * Admin Module (Handler)
 */

#include "x_macros.sqf"

if (hasInterface) then {
    if (GVAR(admin_type_players) find (getPlayerUID player) == -1) exitWith {};
    
    onMapSingleClick "if (_alt) then {(vehicle player) setPos _pos}";
};