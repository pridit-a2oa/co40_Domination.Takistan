#include "x_macros.sqf"
private ["_attacher", "_attachee"];

_attacher = _this select 0;
_attachee = _this select 3;

detach _attachee;

if (alive _attacher && (_this select 2) != "") then {
    _attacher removeAction (_this select 2);
};

_attacher setVariable [QGVAR(release), nil];
_attacher setVariable [QGVAR(attached), objNull];

if ((position _attachee) select 2 > 100) then {
    _attachee spawn {
        private ["_parachute"];
        
        sleep 5;
        
        if ((position _this) select 2 > 100 && {alive _this}) then {
            _parachute = createVehicle ["ParachuteMediumWest", (position _this), [], 0, "NONE"];
            _parachute setPos (position _this);
            
            _this attachTo [_parachute, [0,0,1]];
            
            while {(position _this) select 2 > 3} do {
                sleep 1;
            };
            
            detach _this;

            deleteVehicle _parachute;
        };
    };
};

[_attachee] call FUNC(vehicle,freeze);