/**
 * Marker Module - Vehicle Submodule
 */

#define THIS_MODULE marker
#include "x_macros.sqf"
private ["_vehicle", "_marker", "_range"];
PARAMS_1(_vehicle);

if (!isNil QMODULE(vehicle)) then {
    [_vehicle] __submodule(vehicle);
};

if (!isNil QMODULE(vehicle_mhq)) then {
    [_vehicle] __submodule(vehicle_mhq);
};

if (!isNil QMODULE(vehicle_service)) then {
    [_vehicle] __submodule(vehicle_service);
};

_marker = [_vehicle] call FUNC(THIS_MODULE,valid);

if (!isNil "_marker") then {
    _vehicle addMPEventHandler ["MPKilled", {
        deleteMarkerLocal ([(_this select 0)] call FUNC(THIS_MODULE,valid));
    }];
};

["marker_vehicles", {
    {
        _marker = [_x] call FUNC(THIS_MODULE,valid);
        
        if (!isNil "_marker" && {visibleMap} && {alive _x}) then {
            _marker setMarkerPosLocal (getPosASL _x);
            
            // this will need to change if we ever do OPFOR markers
            if (_x distance (_x getVariable QGVAR(position)) > GVAR(vehicle_distance_visible)) then {
                _marker setMarkerAlphaLocal 1;
            } else {
                _marker setMarkerAlphaLocal 0;
            };
        };
    } forEach vehicles;
}, 2] call FUNC(client,addPerFrame);