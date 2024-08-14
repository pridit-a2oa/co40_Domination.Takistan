/**
 * Marker Module (Handler)
 */

#include "x_macros.sqf"

if (hasInterface) then {
    waitUntil {sleep 0.1; !isNil {X_JIPH getVariable QGVAR(markers)}};

    {
        _marker = createMarkerLocal [(_x select 0), (_x select 1)];
        _marker setMarkerTypeLocal (_x select 2);
        _marker setMarkerTextLocal (_x select 3);
        _marker setMarkerColorLocal (_x select 4);
        _marker setMarkerAlphaLocal (_x select 5);
        _marker setMarkerShapeLocal (_x select 6);

        if !([_x select 7, ""] call BIS_fnc_areEqual) then {
            _marker setMarkerBrushLocal (_x select 7);
        };

        if ([count (_x select 8), 2] call BIS_fnc_areEqual) then {
            _marker setMarkerSizeLocal (_x select 8);
        };
    } forEach (X_JIPH getVariable QGVAR(markers));
};