/**
 * Vehicle Marker Module (Handle)
 */

#define THIS_MODULE vehicle_marker
#include "x_macros.sqf"

if (hasInterface) then {
    ["marker_vehicles", {
        _sides = [0, GVAR(vehicle_marker_types_side)] call FUNC(common,arrayValues);
        _colors = [1, GVAR(vehicle_marker_types_side)] call FUNC(common,arrayValues);
        
        {
            _marker = [_x] call FUNC(THIS_MODULE,valid);
            
            if (!isNil "_marker") then {            
                if (!visibleMap && {isNil {uiNamespace getVariable "BIS_RscMiniMap"}} && {isNil {uiNamespace getVariable "RscMiniMapSmall"}}) exitWith {};
                
                _marker setMarkerPosLocal (getPosASL _x);
                
                _alive = alive _x;
                _distance = _x distance (_x getVariable QGVAR(spawn)) > GVAR(vehicle_marker_visible);
                _hidden = _x getVariable QGVAR(hidden);
                
                if !(_x call FUNC(common,empty)) then {
                    _side = str (side _x);
                    
                    if (_side in _sides) then {
                        _color = _colors select (_sides find _side);
                        
                        if !(markerColor _marker in [_color, "ColorYellow"]) then {
                            _marker setMarkerColorLocal _color;
                        };
                    };
                };
                
                _alpha = if (!_hidden && {!_alive || {_alive && {_distance}}}) then {1} else {0};
                
                if (_alpha != markerAlpha _marker) then {
                    _marker setMarkerAlphaLocal _alpha;
                };
            };
        } forEach vehicles;
    }, 2] call FUNC(client,addPerFrame);
};