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
                _distance = _x distance (_x getVariable QGVAR(spawn)) > GVAR(vehicle_marker_visible);
                _hidden = _x getVariable QGVAR(hidden);
                
                _sides = [0, GVAR(vehicle_marker_types_side)] call FUNC(common,arrayValues);
                _colors = [1, GVAR(vehicle_marker_types_side)] call FUNC(common,arrayValues);
                
                if !(_x call FUNC(common,empty)) then {
                    if (str (side _x) in _sides) then {
                        _color = _colors select (_sides find (str (side _x)));
                        
                        if (_color != markerColor _marker && {markerColor _marker != "ColorYellow"}) then {
                            _marker setMarkerColorLocal _color;
                        };
                    };
                };
                
                if (!_hidden && {!_alive || {_alive && {_distance}}}) then {
                    _marker setMarkerAlphaLocal 1;
                } else {
                    _marker setMarkerAlphaLocal 0;
                };
            };
        } forEach vehicles;
    }, 2] call FUNC(client,addPerFrame);
};