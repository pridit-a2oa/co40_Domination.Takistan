#include "x_macros.sqf"
private ["_attacher", "_attachee"];

_attacher = _this select 0;
_attachee = _this select 3;

_attacher removeAction (_this select 2);

detach _attachee;

_attacher setVariable [QGVAR(attached), false];

if ((position _attachee) select 2 > 100) then {
    _attachee spawn {
        private ["_parachute"];
        
        sleep 5;
        
        if ((position _this) select 2 > 100) then {
            _parachute = createVehicle ["ParachuteMediumWest", (position _this), [], 0, "NONE"];
            _parachute setPos (position _this);
            
            _this attachTo [_parachute, [0,0,1]];
            
            while {(position _this) select 2 > 1} do {
                sleep 1;
            };
            
            detach _this;

            deleteVehicle _parachute;
        };
    };
};