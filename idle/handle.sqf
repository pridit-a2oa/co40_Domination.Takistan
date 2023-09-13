/**
 * Idle Module (Handler)
 */

#include "x_macros.sqf"

if (hasInterface) then {
    0 spawn {
        private ["_position", "_direction", "_time"];
        
        while {hasInterface} do {
            sleep 20;
            
            _time = 0;
            
            _position = getPosATL player;
            _direction = direction player;
            
            while {alive player && {!(player getVariable QGVAR(unconscious))}} do {
                if !([getPosATL player, _position] call BIS_fnc_areEqual) exitWith {};
                if !([direction player, _direction] call BIS_fnc_areEqual) exitWith {};
                
                _time = _time + 1;
                
                switch (_time) do {
                    case (round (GVAR(idle_time_static) / 1.2)): {
                        systemChat format [
                            "You have been idle for %1m and will be kicked in %2m.",
                            round (_time / 60),
                            ceil ((GVAR(idle_time_static) - _time) / 60)
                        ];
                    };
                    
                    case GVAR(idle_time_static): {
                        endMission "LOSER";
                    };
                };
                
                sleep 1;
            };
        };
    };
};