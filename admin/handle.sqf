/**
 * Admin Module (Handler)
 */

#include "x_macros.sqf"

if (hasInterface) then {
    if !(getPlayerUID player in GVAR(admin_type_players)) exitWith {};

    onMapSingleClick "if (_alt) then {(vehicle player) setPos [_pos select 0, _pos select 1, 0];(vehicle player) setVectorUp surfaceNormal _pos};[50] call d_fnc_client_reveal";
};