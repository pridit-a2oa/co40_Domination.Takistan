/**
 * Admin Module (Handler)
 */

#include "x_macros.sqf"

if (hasInterface) then {
    if ([GVAR(admin_type_players) find (getPlayerUID player), -1] call BIS_fnc_areEqual) exitWith {};

    onMapSingleClick "if (_alt) then {(vehicle player) setPos [_pos select 0, _pos select 1, 0];(vehicle player) setVectorUp surfaceNormal _pos};[50] call d_fnc_client_reveal";
};