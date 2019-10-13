/**
 * Admin Module (Handler)
 */

#include "x_macros.sqf"

if (hasInterface) then {
    if (isMultiplayer && {GVAR(admin_type_players) find (getPlayerUID player) == -1}) exitWith {};
    
    onMapSingleClick "if (_alt) then {(vehicle player) setPos [_pos select 0, _pos select 1, 0];(vehicle player) setVectorUp surfaceNormal _pos}";
};