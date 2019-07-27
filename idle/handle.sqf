/**
 * Idle Module (Handler)
 */

#include "x_macros.sqf"

if (hasInterface) then {
    0 spawn {
        private ["_position", "_time"];
        
        while {hasInterface} do {
            _position = getPosATL player;
            _time = 0;
            
            sleep GVAR(idle_time_sleep);
            
            while {[getPosATL player, _position] call BIS_fnc_areEqual} do {
                _time = _time + GVAR(idle_time_sleep);
                
                switch (_time) do {                    
                    case (round (GVAR(idle_time_static) / 1.2)): {
                        systemChat format [
                            "You have been idle for %1m and will be kicked in %2m.",
                            round (_time / 60),
                            ceil ((GVAR(idle_time_static) - _time) / 60)
                        ];
                    };
                    
                    case GVAR(idle_time_static): {
                        endMission "END1";
                    };
                };
                
                sleep GVAR(idle_time_sleep);
            };
        };
    };
};