/**
 * Marker Module - Vehicle Submodule
 */

#define THIS_MODULE marker
#include "x_macros.sqf"
private ["_vehicle", "_marker"];
PARAMS_1(_vehicle);

if (!isNil QUOTE(MODULE(vehicle))) then {
    [_vehicle] __submodule(vehicle);
};

if (!isNil QUOTE(MODULE(vehicle_mhq))) then {
    [_vehicle] __submodule(vehicle_mhq);
};

["marker_vehicles", {
    {
        if (!visibleMap) exitWith {};
        
        _marker = [_x] call FUNC(THIS_MODULE,valid);
        
        if (!isNil "_marker") then {
            _marker setMarkerPosLocal (getPosASL _x);
        };
    } forEach vehicles;
}, 2] call FUNC(client,addPerFrame);

_marker = [_vehicle] call FUNC(THIS_MODULE,valid);

if (!isNil "_marker") then {
    _vehicle addMPEventHandler ["MPKilled", {
        deleteMarkerLocal ([(_this select 0)] call FUNC(THIS_MODULE,valid));
    }];
};