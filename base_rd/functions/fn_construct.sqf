#define THIS_MODULE base_rd
#include "x_macros.sqf"
private ["_type", "_vehicle", "_time"];

PARAMS_1(_type);

if (hasInterface) then {
    private ["_name", "_checks"];

    _name = "R&D point";
    _checks = [
        [
            _name,
            GVAR(base_rd) getVariable QGVAR(processing),
            true
        ] call FUNC(helper,inProgress),

        [
            _name,
            position GVAR(base_rd)
        ] call FUNC(helper,nearAny),

        [
            [_name, "used to construct"],
            player getVariable QGVAR(base_rd_cooldown)
        ] call FUNC(helper,timeExceeded)
    ];

    {
        if (typeName _x == "STRING") exitWith {
            hint _x;
        };
    } forEach _checks;

    if ({str (_x) == "true"} count _checks < count _checks) exitWith {};

    player setVariable [
        QGVAR(base_rd_cooldown),
        (([_type, "time"] call FUNC(THIS_MODULE,item)) select 0) + GVAR(base_rd_time_cooldown) + call FUNC(common,time)
    ];

    GVAR(base_rd) setVariable [QGVAR(build), true, true];

    if !(isServer) then {
        [gameLogic, "execVM", [_this, __function(construct)]] call FUNC(network,mp);
    };
};

if (isServer && {!(GVAR(base_rd) getVariable QGVAR(processing))} && {GVAR(base_rd) getVariable QGVAR(build)}) then {
    private ["_vehicle", "_time"];

    GVAR(base_rd) setVariable [QGVAR(processing), true, true];
    GVAR(base_rd) setVariable [QGVAR(build), false, true];

    _vehicle = _type createVehicle (position GVAR(base_rd));
    _vehicle setDir (getDir GVAR(base_rd));
    _vehicle setPos (position GVAR(base_rd));
    _vehicle setVelocity [0, 0, 0];
    _vehicle setVectorUp surfaceNormal (position GVAR(base_rd));

    _vehicle lock true;
    _vehicle allowDamage false;

    [true, "enableSimulation", [_vehicle, false], false] call FUNC(network,mp);

    if (!isNil QMODULE(vehicle_respawn)) then {
        _vehicle setVariable [QGVAR(respawnable), false, true];
    };

    if (!isNil QMODULE(vehicle_wreck)) then {
        _vehicle setVariable [QGVAR(wreckable), false, true];
    };
    
    __addDead(_vehicle);

    if (!isNil QMODULE(vehicle)) then {
        [true, "execVM", [[_vehicle], FUNCTION(vehicle,handle)]] call FUNC(network,mp);
    };

    __log format ["Constructing %1", [typeOf _vehicle] call FUNC(vehicle,name)]];

    _time = ([_type, "time"] call FUNC(THIS_MODULE,item)) select 0;

    if (!isNil QMODULE(crossroad)) then {
        GVAR(crossroad) kbTell [
            GVAR(crossroad2),
            "base_rd",
            "Construct",
            ["1", {}, [typeOf _vehicle] call FUNC(vehicle,name), []],
            ["2", {}, str floor(_time / 60), []],
            true
        ];
    };

    if (!isNil QMODULE(3d)) then {
        [true, "spawn", [[_time], {
            private ["_time"];
            
            PARAMS_1(_time);
            
            [GVAR(base_rd), _time] call FUNC(3d,time);
        }]] call FUNC(network,mp);
    };

    _time = _time + call FUNC(common,time);

    while {call FUNC(common,time) < _time} do {    
        // remaining time is greater than the maximum it could ever be
        if ((_time - call FUNC(common,time)) > call FUNC(THIS_MODULE,max)) exitWith {};

        if ({_x distance _vehicle < 30} count (call FUNC(common,players)) > 0) then {
            _vehicle spawn {
                sleep (random 10);
                
                [true, "say", [_this, QGVAR(sound_weld), 20]] call FUNC(network,mp);
            };
        };
        
        sleep 15;
    };

    _vehicle lock false;
    _vehicle allowDamage true;

    [true, "enableSimulation", [_vehicle, true], false] call FUNC(network,mp);

    if (!isNil QMODULE(crossroad)) then {
        GVAR(crossroad) kbTell [
            GVAR(crossroad2),
            "base_rd",
            "Ready",
            ["1", {}, [typeOf _vehicle] call FUNC(vehicle,name), []],
            true
        ];
    };

    GVAR(base_rd) setVariable [QGVAR(processing), false, true];
};