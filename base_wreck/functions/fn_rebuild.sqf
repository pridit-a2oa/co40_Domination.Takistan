#define THIS_MODULE base_wreck
#include "x_macros.sqf"
private ["_wreck", "_time", "_lifter", "_vehicle"];

PARAMS_2(_wreck, _time);

[_wreck, "setVelocity", [0, 0, 0]] call FUNC(network,mp);
[true, "setVectorUp", [_wreck, surfaceNormal (position GVAR(base_wreck))]] call FUNC(network,mp);

_lifter = _wreck getVariable QGVAR(lifted);

if !(isNil QMODULE(conversation)) then {
    [
        [GVAR(crossroad), GVAR(crossroad2)],
        [QUOTE(THIS_MODULE), "Rebuilding"],
        [
            ["1", {}, [typeOf _wreck] call FUNC(vehicle,name), []],
            ["2", {}, str floor(_time / 60), []]
        ]
    ] call FUNC(conversation,radio);
};

_vehicle = [
    _wreck,
    GVAR(base_wreck) modelToWorld ([typeOf _wreck] call FUNC(THIS_MODULE,offset)),
    direction GVAR(base_wreck)
] call FUNC(vehicle,respawn);

_vehicle lock true;
_vehicle allowDamage false;

sleep 2;

[true, "enableSimulation", [_vehicle, false]] call FUNC(network,mp);

if ((faction _vehicle) in ["BIS_TK", "BIS_TK_INS"]) then {
    _vehicle setVariable [QGVAR(built), true, true];

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

if !(isNil QMODULE(menu) && {isNil QMODULE(menu_vehicle)}) then {
    _vehicle setVariable [QGVAR(menu), false, true];
};

if (!isNil QMODULE(vehicle_tow)) then {
    _vehicle setVariable [QGVAR(towed), true, true];
};

[true, "execVM", [[_vehicle], FUNCTION(vehicle,handle)]] call FUNC(network,mp);

__log format ["Rebuilding %1", [typeOf _vehicle] call FUNC(vehicle,name)]];

if (!isNil QMODULE(3d)) then {
    [true, "spawn", [[_time], {
        private ["_time"];

        PARAMS_1(_time);

        [GVAR(base_wreck), _time] call FUNC(3d,time);
    }]] call FUNC(network,mp);
};


if (!isNil QMODULE(reward) && {!isNil "_lifter"}) then {
    _lifter spawn {
        sleep 2;

        {
            if ([getPlayerUID _x, _this select 1] call BIS_fnc_areEqual) exitWith {
                [
                    _x,
                    GVAR(base_wreck_amount_score_rebuild),
                    "collecting a wreck"
                ] call FUNC(reward,score);

                if !(isNil QMODULE(database)) then {
                    [getPlayerUID _x, 10] spawn FUNC(database,statistic);
                };
            };
        } forEach (call FUNC(common,players));
    };
};

["Wreck", _vehicle, _time, call FUNC(THIS_MODULE,max)] call FUNC(vehicle,stall);

[_vehicle] call FUNC(THIS_MODULE,rebuilt);

sleep 2;

if (!isNil QMODULE(reward) && {!isNil "_lifter"}) then {
    private ["_distance", "_player"];

    _distance = ([1, _lifter select 2] call FUNC(common,arrayValues)) call BIS_fnc_greatestNum;

    _player = [_lifter select 2, _distance] call BIS_fnc_findNestedElement;

    if (_distance < GVAR(base_wreck_distance_score)) exitWith {};

    {
        if ([getPlayerUID _x, ((_lifter select 2) select (_player select 0)) select 0] call BIS_fnc_areEqual) exitWith {
            [
                _x,
                GVAR(base_wreck_amount_score_travel),
                "having retrieved a rebuilt wreck"
            ] call FUNC(reward,score);
        };
    } forEach (call FUNC(common,players));
};