#define THIS_MODULE base_wreck
#include "x_macros.sqf"
private ["_wreck", "_time", "_lifter", "_position", "_vehicle"];

PARAMS_2(_wreck, _time);

_lifter = _wreck getVariable QGVAR(lifter);

if (!isNil QMODULE(crossroad)) then {
    GVAR(crossroad) kbTell [GVAR(crossroad2), "base_wreck", "Rebuilding", ["1", {}, [typeOf _wreck] call FUNC(vehicle,name), []], ["2", {}, str floor(_time / 60), []], true];
};

deleteMarker (_wreck getVariable QGVAR(id));
deleteVehicle _wreck;

_position = [(position GVAR(service_wreck)) select 0, (position GVAR(service_wreck)) select 1, 0];

_vehicle = createVehicle [typeOf _wreck, _position, [], 0, "NONE"];
_vehicle setDir (getDir _wreck);
_vehicle setPos _position;
_vehicle setVelocity [0, 0, 0];
_vehicle setVectorUp surfaceNormal (position GVAR(service_wreck));

_vehicle lock true;
_vehicle allowDamage false;

__log format ["Rebuilding %1", [typeOf _vehicle] call FUNC(vehicle,name)]];

if (!isNil QMODULE(3d)) then {
    [true, "spawn", [[_time], {
        [GVAR(service_wreck), _this] call FUNC(3d,time);
    }]] call FUNC(network,mp);
};

_time = _time + call FUNC(common,time);

if ((faction _vehicle) in ["BIS_TK", "BIS_TK_INS"]) then {
    _vehicle setVariable [QGVAR(rebuilt), true, true];
    
    if (!isNil QMODULE(vehicle_respawn)) then {
        _vehicle setVariable [QGVAR(respawnable), false, true];
    };
    
    if (!isNil QMODULE(vehicle_wreck)) then {
        _vehicle setVariable [QGVAR(wreckable), false, true];
    };
    
    __addDead(_vehicle);
} else {
    if (!isNil QMODULE(vehicle_wreck)) then {
        _vehicle setVariable [QGVAR(wreckable), true, true];
    };
};

if (!isNil QMODULE(vehicle_tow)) then {
    _vehicle setVariable [QGVAR(towed), true, true];
};

[true, "execVM", [[_vehicle], __handlerRE(vehicle)]] call FUNC(network,mp);

while {call FUNC(common,time) < _time} do {
    // remaining time to rebuild is greater than the maximum it could ever be
    if ((_time - call FUNC(common,time)) > call FUNC(THIS_MODULE,max)) exitWith {};
    
    if ({_x distance _vehicle < 30} count (call FUNC(common,players)) > 0) then {
        _vehicle spawn {
            sleep (random 10);
            
            [true, "say", [_this, QGVAR(sound_weld), 20]] call FUNC(network,mp);
        };
    };
    
    sleep 15;
};

[_vehicle] call FUNC(THIS_MODULE,rebuilt);

if (!isNil "_lifter") then {
    {
        if (name _x == _lifter) exitWith {
            _x addScore GVAR(base_wreck_amount_score);
            
            [_x, "systemChat", format [
                "You have been awarded %1 score for rebuilding a wreck",
                GVAR(base_wreck_amount_score)
            ]] call FUNC(network,mp);
        };
    } forEach (call FUNC(common,players));
};