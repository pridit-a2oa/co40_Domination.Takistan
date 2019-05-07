/**
 * Vehicle Marker Module (Handle)
 */

#define THIS_MODULE vehicle_marker
#include "x_macros.sqf"

if (hasInterface) then {
    ["marker_vehicles", {
        {
            _marker = [_x] call FUNC(THIS_MODULE,valid);
            
            if (!isNil "_marker" && {visibleMap} && {alive _x}) then {
                _marker setMarkerPosLocal (getPosASL _x);
                
                if (_x distance (_x getVariable QGVAR(position)) > GVAR(vehicle_marker_visible) && {!(_x getVariable QGVAR(hidden))}) then {
                    _marker setMarkerAlphaLocal 1;
                } else {
                    _marker setMarkerAlphaLocal 0;
                };
            };
        } forEach vehicles;
    }, 2] call FUNC(client,addPerFrame);
};