/**
 * R&D Module (Handler)
 */

#include "x_macros.sqf"

if (hasInterface) then {
    _marker = createMarkerLocal ["base_rd", position GVAR(base_rd)];
    _marker setMarkerTextLocal "R&D";
    _marker setMarkerColorLocal "ColorKhaki";
    _marker setMarkerShapeLocal "ICON";
    _marker setMarkerTypeLocal "DOT";
};