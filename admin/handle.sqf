/**
 * Admin Module (Handler)
 */

#define THIS_MODULE admin
#include "x_macros.sqf"

if (hasInterface) then {
    if !(call FUNC(THIS_MODULE,valid));

    onMapSingleClick "if (_alt) then {(vehicle player) setPos [_pos select 0, _pos select 1, 0];(vehicle player) setVectorUp surfaceNormal _pos};[50] call d_fnc_client_reveal";
};