#define THIS_MODULE mission_main
#include "x_macros.sqf"
private ["_target", "_type", "_position", "_antennas", "_near", "_camps", "_camp"];

PARAMS_2(_target, _type);

switch (_type) do {
    case "camp": {
        _camps = 0;

        while {_camps != GVAR(mission_main_count_camps)} do {
            _position = [position _target, 20, 250, 10, 0, 0.5, 0] call FUNC(common,safePos);
            _near = nearestObjects [_position, ["Land_tent_east"], 100];
            
            if (count _near < 1) then {
                _camp = [_position, random 360, GVAR(mission_main_type_camp)] call FUNC(common,objectMapper);
                
                {
                    _x addEventHandler ["HandleDamage", {0}];
                    
                    if (typeOf _x == "FlagCarrierTakistanKingdom_EP1") then {
                        _x setFlagTexture "\ca\ca_e\data\flag_tka_co.paa";
                        
                        [nil, _x, "per", rAddAction, "Capture" call FUNC(common,BlueText), __function(capture), [], 10, false, true, "", ""] call RE;
                    };
                    
                    [nil, _x, "per", rEnableSimulation, false];
                } forEach _camp;
                
                [nil, nil, rSpawn, [_position], {
                    private ["_position"];
                    
                    PARAMS_1(_position);
                    
                    if (!isNil QMODULE(marker)) then {
                        [
                            format ["camp_%1", str (_position)],
                            _position,
                            "Strongpoint",
                            "",
                            "ColorWhite",
                            "ICON",
                            [0.5, 0.5]
                        ] call FUNC(marker,create);
                    };
                }] call RE;

                _camps = _camps + 1;
            };

            sleep 0.5;
        };
    };
    
    case "radio": {
        _antennas = 0;
        
        while {_antennas != GVAR(mission_main_count_antennas)} do {
            _position = [position _target, 50, 200, 2, 0, 0.3, 0] call FUNC(common,safePos);
            _near = nearestObjects [_position, [GVAR(mission_main_type_antenna)], 100];
            
            if (count _near < 1) then {
                GVAR(mission_main_type_antenna) createVehicle _position;

                [nil, nil, rSpawn, [_position], {
                    private ["_position"];
                    
                    PARAMS_1(_position);
                    
                    if (!isNil QMODULE(marker)) then {
                        [
                            format ["antenna_%1", str (_position)],
                            _position,
                            "FOB",
                            "",
                            "ColorWhite",
                            "ICON",
                            [0.7, 0.9]
                        ] call FUNC(marker,create);
                    };
                }] call RE;
                
                _antennas = _antennas + 1;
            };
            
            sleep 0.5;
        };
    };
};