#define THIS_MODULE vehicle_wreck
#include "x_macros.sqf"
private ["_wreck", "_time", "_position", "_vehicle"];

PARAMS_2(_wreck, _time);

if (!isNil QMODULE(crossroad)) then {
    GVAR(crossroad) kbTell [GVAR(crossroad2), "vehicle_wreck", "Rebuilding", ["1", {}, [typeOf _wreck] call FUNC(vehicle,name), []], ["2", {}, str floor(_time / 60), []], true];
};

deleteMarker (str ((_wreck getVariable QGVAR(position)) select 0));
deleteVehicle _wreck;

_position = [(markerPos QGVAR(service_wreck)) select 0, (markerPos QGVAR(service_wreck)) select 1, 0];

_vehicle = createVehicle [typeOf _wreck, _position, [], 0, "NONE"];
_vehicle setDir (getDir _wreck);
_vehicle setPos _position;
_vehicle setVectorUp surfaceNormal (markerPos QGVAR(service_wreck));

_vehicle lock true;
_vehicle allowDamage false;

_time = _time + call FUNC(common,time);

if (!isNil QMODULE(vehicle_bonus)) then {
    [_vehicle] __submodulePP(vehicle_bonus);
};

if (faction _vehicle != "BIS_US") then {
    if (!isNil QMODULE(vehicle_respawn)) then {
        _vehicle setVariable [QGVAR(respawnable), false, true];
    };
    
    if (!isNil QMODULE(vehicle_wreck)) then {
        _vehicle setVariable [QGVAR(wreckable), false, true];
    };
};

[nil, nil, rExecVM, __handlerRE(vehicle), _vehicle] call RE;

while {call FUNC(common,time) < _time} do {
    if ({_x distance _vehicle < 30} count GVAR(players) > 0) then {
        _vehicle spawn {
            sleep (random 10);
            
            [nil, _this, rSay, QGVAR(sound_weld), 20] call RE;
        };
    };
    
    sleep 15;
};

[_vehicle] spawn FUNC(THIS_MODULE,rebuilt);