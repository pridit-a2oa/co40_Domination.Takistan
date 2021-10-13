#include "x_macros.sqf"
private ["_position", "_type", "_vehicle"];

PARAMS_1(_position);

_type = GVAR(mission_mini_abandoned_types_vehicle) call BIS_fnc_selectRandom;

_vehicle = _type createVehicle _position;
_vehicle setDir (random 360);
_vehicle setPos _position;
_vehicle setVectorUp surfaceNormal _position;
_vehicle setFuel random (0.3);
_vehicle setDamage (random 0.4);

switch (round (random 3)) do {
    case 0: {
        _vehicle setHit ["wheel_1_1_steering", 1];
        _vehicle setHit ["wheel_1_2_steering", 1];
    };
    
    case 1: {
        _vehicle setHit ["wheel_1_1_steering", 1];
        _vehicle setHit ["wheel_2_1_steering", 1];
    };
    
    case 2: {
        _vehicle setHit ["wheel_2_1_steering", 1];
        _vehicle setHit ["wheel_2_2_steering", 1];
    };
    
    case 3: {
        _vehicle setHit ["wheel_1_2_steering", 1];
        _vehicle setHit ["wheel_2_1_steering", 1];
        _vehicle setHit ["wheel_2_2_steering", 1];
    };
};

if (!isNil QMODULE(vehicle)) then {
    [true, "execVM", [[_vehicle], FUNCTION(vehicle,handle)]] call FUNC(network,mp);
};

if (!isNil QMODULE(marker)) then {
    GVAR(intel_trigger) setVariable ["vehicle", _vehicle];
    GVAR(intel_trigger) setTriggerStatements [
        "!alive (thisTrigger getVariable ""vehicle"") || {(position (thisTrigger getVariable ""vehicle"")) distance ((thisTrigger getVariable ""vehicle"") getVariable 'd_position') > 5}",
        "[thisTrigger] call d_fnc_mission_mini_complete",
        ""
    ];
};