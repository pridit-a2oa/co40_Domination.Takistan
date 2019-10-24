#include "x_macros.sqf"
private ["_attacher", "_id", "_attachee", "_position"];

_attacher = _this select 0;
_id = _this select 2;
_attachee = _this select 3;

_position = position _attachee;

[true, "enableSimulation", [_attachee, false]] call FUNC(network,mp);

detach _attachee;

_attachee setPos (_attacher modelToWorld [0, 0, -14]);

[_attachee, "setVectorDirAndUp", [vectorDir _attacher, vectorUp _attacher]] call FUNC(network,mp);

[true, "enableSimulation", [_attachee, true]] call FUNC(network,mp);

if (alive _attacher && {typeName _id == "SCALAR"}) then {
    _attacher removeAction _id;
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
            
            _this attachTo [_parachute, [0, 0, 1]];
            
            while {(position _this) select 2 > 3} do {
                sleep 1;
            };
            
            detach _this;

            deleteVehicle _parachute;
        };
    };
};

if (!alive _attachee && {_attachee isKindOf "Air"}) then {
    [_attachee] call FUNC(vehicle,freeze);
};