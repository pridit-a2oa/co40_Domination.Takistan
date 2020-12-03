#define THIS_MODULE intel
#include "x_macros.sqf"
private ["_type", "_position", "_name", "_marker"];

PARAMS_1(_type);

_position = [markerPos QGVAR(intel), 800, 1600, 10, 0, 0.1, 0] call FUNC(common,safePos);

if (!isNil QMODULE(marker)) then {
    _name = format ["intel_%1", str (_position)];
    
    [true, "spawn", [[_position, _name], {
        private ["_position", "_name"];

        PARAMS_2(_position, _name);

        if (!isNil QMODULE(marker)) then {
            [
                _name,
                _position,
                "mil_unknown",
                " Intel",
                "ColorOrange",
                1,
                "ICON",
                [0.8, 0.8]
            ] call FUNC(marker,create);
        };
    }]] call FUNC(network,mp);
    
    GVAR(intel_trigger) = createTrigger ["EmptyDetector", _position];
    GVAR(intel_trigger) setVariable ["marker", _name];
    GVAR(intel_trigger) setTriggerArea [200, 200, 0, false];
    GVAR(intel_trigger) setTriggerActivation ["WEST", "PRESENT", false];
};

switch (_type) do {
    case "enemy encampment": {        
        [
            _position,
            random 360,
            "Camp1_TK_EP1"
        ] call FUNC(server,objectMapper);
        
        _group = [
            _position,
            east,
            (configFile >> "CfgGroups" >> "East" >> "BIS_TK" >> "Infantry" >> "TK_InfantrySection")
        ] call FUNC(server,spawnGroup);
        
        if (!isNil QMODULE(marker)) then {
            GVAR(intel_trigger) setVariable ["units", units _group];
            GVAR(intel_trigger) setTriggerStatements [
                "({!alive _x} count (thisTrigger getVariable ""units"")) > 2",
                "[(thisTrigger getVariable ""marker"")] call d_fnc_marker_delete; X_JIPH setVariable ['d_intel', false, true];",
                ""
            ];
        };
        
        if (!isNil QMODULE(unit)) then {
            [_group, _position] call FUNC(unit,defend);
        };
    };
    
    case "abandoned light vehicle": {
        _vehicles = [
            "BAF_Jackal2_L2A1_D",
            "BAF_Jackal2_L2A1_w",
            "HMMWV_M1151_M2_DES_EP1"
        ];
        
        _vehicle = (_vehicles call BIS_fnc_selectRandom) createVehicle _position;
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
        
        [true, "execVM", [[_vehicle], FUNCTION(vehicle,handle)]] call FUNC(network,mp);

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