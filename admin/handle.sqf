/**
 * Admin Module (Handler)
 */

#include "x_macros.sqf"

if (hasInterface) then {
    if (isMultiplayer && {GVAR(admin_type_players) find (getPlayerUID player) == -1}) exitWith {};
    
    onMapSingleClick "if (_alt) then {(vehicle player) setPosASL [_pos select 0, _pos select 1, (_pos select 2) + 100]}";
};