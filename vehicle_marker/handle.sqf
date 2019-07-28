/**
 * Vehicle Marker Module (Handle)
 */

#define THIS_MODULE vehicle_marker
#include "x_macros.sqf"

if (hasInterface) then {
    ["marker_vehicles", {
        {
            _marker = [_x] call FUNC(THIS_MODULE,valid);

            if (!isNil "_marker") then {            
                if (!visibleMap && {isNil {uiNamespace getVariable "BIS_RscMiniMap"}} && {isNil {uiNamespace getVariable "RscMiniMapSmall"}}) exitWith {};

                _marker setMarkerPosLocal (getPosASL _x);
                
                _alive = alive _x;
                _distance = _x distance (_x getVariable QGVAR(position)) > GVAR(vehicle_marker_visible);
                _hidden = _x getVariable QGVAR(hidden);
                
                if (!_hidden && {!_alive || {_alive && {_distance || (faction _x) in ["BIS_TK", "BIS_TK_INS"]}}}) then {
                    _marker setMarkerAlphaLocal 1;
                } else {
                    _marker setMarkerAlphaLocal 0;
                };
            };
        } forEach vehicles;
    }, 2] call FUNC(client,addPerFrame);
};