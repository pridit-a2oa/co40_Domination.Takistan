#include "x_macros.sqf"
private ["_type", "_position", "_marker"];

PARAMS_1(_type);

_position = GVAR(intel_type_positions) call BIS_fnc_selectRandom;

if (!isNil QMODULE(marker)) then {
    _marker = ([
        format ["intel_%1", str (_position)],
        _position,
        "mil_unknown",
        " Intel",
        "ColorOrange"
    ] call FUNC(marker,create));
    
    GVAR(intel_trigger) = createTrigger ["EmptyDetector", _position];
    GVAR(intel_trigger) setVariable ["marker", _marker];
    GVAR(intel_trigger) setTriggerArea [200, 200, 0, false];
    GVAR(intel_trigger) setTriggerActivation ["WEST", "PRESENT", false];
};

switch (_type) do {
    case "enemy encampment": {
        if (!isNil QMODULE(marker)) then {
            GVAR(intel_trigger) setVariable ["units", _units];
            GVAR(intel_trigger) setTriggerStatements [
                "({!alive _x} forEach (thisTrigger getVariable ""units"")) > 0",
                "[(thisTrigger getVariable ""marker"")] call d_fnc_marker_delete; X_JIPH setVariable ['d_intel', false, true];",
                ""
            ];
        };
    };
    
    case "abandoned light vehicle": {
        _vehicles = [
            "BAF_Jackal2_L2A1_D",
            "BAF_Jackal2_L2A1_w"
        ];
        
        _vehicle = (_vehicles call BIS_fnc_selectRandom) createVehicle _position;
        _vehicle setDir (random 360);
        _vehicle setPos _position;
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
        
        [nil, nil, rExecVM, __handlerRE(vehicle), _vehicle] call RE;

        if (!isNil QMODULE(marker)) then {
            GVAR(intel_trigger) setVariable ["vehicle", _vehicle];
            GVAR(intel_trigger) setTriggerStatements [
                "!alive (thisTrigger getVariable ""vehicle"") || {(position (thisTrigger getVariable ""vehicle"")) distance ((thisTrigger getVariable ""vehicle"") getVariable 'd_position') > 5}",
                "[(thisTrigger getVariable ""marker"")] call d_fnc_marker_delete; X_JIPH setVariable ['d_intel', false, true];",
                ""
            ];
        };
    };
};

GVAR(intel_trigger) = nil;