/**
 * Marker Module (Handler)
 */

#include "x_macros.sqf"

if (isServer) then {
    X_JIPH setVariable [QGVAR(markers), [], true];
};

if (hasInterface) then {
    waitUntil {!isNil {X_JIPH getVariable QGVAR(markers)}};
    
    {
        _marker = createMarkerLocal [(_x select 0), (_x select 1)];
        _marker setMarkerTypeLocal (_x select 2);
        _marker setMarkerTextLocal (_x select 3);
        _marker setMarkerColorLocal (_x select 4);
    } forEach (X_JIPH getVariable QGVAR(markers));
};