#include "x_macros.sqf"
private ["_vehicle", "_occupied", "_position", "_atv"];
PARAMS_1(_vehicle);

_occupied = nearestObjects [_vehicle, ["ATV_US_EP1"], 8];

if (count _occupied > 0) exitWith {
    closeDialog 0;
    [_vehicle] call FUNC(vehicle_menu,show);
};

_position = _vehicle modelToWorld [-4,0,0];

_atv = createVehicle ["ATV_US_EP1", [_position select 0, _position select 1, 0], [], 0, "NONE"];
_atv setDir ((direction _vehicle) - 180);
_atv setVectorUp (vectorUp _vehicle);
_atv setPos [_position select 0, _position select 1, 0];
player reveal _atv;

[nil, _atv, rSay, QGVAR(sound_build), 20] call RE;

[nil, nil, rExecVM, __handlerRE(vehicle), _atv] call RE;

_atv setVariable [QGVAR(respawnable), false, true];

_atv spawn {
    sleep 10;
    
    while {true} do {
        _far = {_x distance _this < GVAR(vehicle_distance)} count GVAR(players) < 1;
        
        if (_far && {_this call FUNC(common,empty)}) exitWith {
            deleteVehicle _this;
        };
        
        sleep 5;
    };
};

closeDialog 0;