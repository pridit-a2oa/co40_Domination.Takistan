#define THIS_MODULE vehicle_lift
#include "x_macros.sqf"
private ["_lifter", "_caller", "_announce", "_vehicle", "_attached"];

PARAMS_1(_lifter);

_caller = [_this, 1, ""] call FUNC(common,param);
_announce = [_this, 5, false] call FUNC(common,param);

_vehicle = call FUNC(THIS_MODULE,valid);

if !([typeName _vehicle, "OBJECT"] call BIS_fnc_areEqual) exitWith {};

_attached = _lifter getVariable QGVAR(attached);

if !(isNull _attached) exitWith {};

if (hasInterface) then {
    private ["_checks"];

    _checks = if !([_caller, ""] call BIS_fnc_areEqual) then {
        [
            [
                [[typeOf _vehicle] call FUNC(vehicle,name), "lifted"],
                player getVariable QGVAR(vehicle_lift_cooldown)
            ] call FUNC(helper,timeExceeded)
        ];
    } else {[]};

    {
        if ([typeName _x, "STRING"] call BIS_fnc_areEqual) exitWith {
            hint _x;
        };
    } forEach _checks;

    if ({[typeName _x, "STRING"] call BIS_fnc_areEqual} count _checks > 0) exitWith {};

    if (!isNil QMODULE(conversation) && {call FUNC(common,time) > player getVariable QGVAR(conversation_cooldown)}) then {
        switch (true) do {
            case (!isNil QMODULE(vehicle_mhq) && {alive _vehicle} && {(typeOf _vehicle) in GVAR(vehicle_mhq_types)});
            case (!isNil QMODULE(vehicle_wreck) && {!alive _vehicle} && {_vehicle getVariable QGVAR(wreckable)} && {(position _lifter) distance (markerPos QGVAR(base_south)) > 500}): {
                _this set [5, true];

                player setVariable [
                    QGVAR(conversation_cooldown),
                    call FUNC(common,time) + GVAR(conversation_time_cooldown)
                ];
            };
        };
    };

    player setVariable [QGVAR(vehicle_lift_cooldown), time + GVAR(vehicle_lift_cooldown)];

    if !(isServer) then {
        [gameLogic, "execVM", [_this, __function(attach)]] call FUNC(network,mp);
    };
};

if (isServer) then {
    private ["_attached", "_lifted"];

    _lifter setVariable [QGVAR(attached), _vehicle, true];

    switch (true) do {
        case !(alive _vehicle): {
            _lifted = _vehicle getVariable QGVAR(lifted);
            
            if (isNil "_lifted") then {
                _vehicle setVariable [QGVAR(lifted), [position _vehicle, objNull, []]];
            } else {
                _lifted set [0, position _vehicle];
            };
        };

        case (alive _vehicle): {
            {
                [_x, "action", ["Eject", vehicle _x]] call FUNC(network,mp);
            } forEach crew _vehicle;

            waitUntil {
                sleep 0.1;
                
                [count crew _vehicle, 0] call BIS_fnc_areEqual
            };

            if (isEngineOn _vehicle) then {
                [_vehicle, "engineOn", false] call FUNC(network,mp);
            };
        };
    };

    [_vehicle, "lock", true] call FUNC(network,mp);

    _vehicle attachTo [_lifter, [0, 0, -12]];

    [true, "enableSimulation", [_vehicle, false]] call FUNC(network,mp);

    if !(isNil QMODULE(vehicle_marker)) then {
        [_lifter, _vehicle] __submoduleVM(vehicle_marker);
    };

    if (_announce) then {
        [
            [GVAR(crossroad), GVAR(crossroad2)],
            [QUOTE(THIS_MODULE), "Airlift"],
            [
                ["1", {}, [typeOf _vehicle] call FUNC(vehicle,name), []],
                ["2", {}, if !(alive _vehicle) then {" wreck"} else {""}, []]
            ],
            true
        ] call FUNC(conversation,radio);
    };

    while {alive _lifter && {!isNull (_lifter getVariable QGVAR(attached)) && {!isNull (driver _lifter)}}} do {
        sleep 2;
    };

    if (isNull (_lifter getVariable QGVAR(attached))) exitWith {};

    sleep 1;

    [_lifter] call FUNC(THIS_MODULE,detach);
};