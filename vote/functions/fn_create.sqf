#define THIS_MODULE vote
#include "x_macros.sqf"
private ["_type", "_subtype", "_types", "_format", "_checks"];

PARAMS_2(_type, _subtype);

disableSerialization;

_types = (call FUNC(THIS_MODULE,types)) select _type;

_type = _types select 0;

_format = format [
    "%1 (%2)",
    _type,
    ((_types select 1) select _subtype) select 0
];

if (hasInterface) then {
    private ["_name"];

    _name = "Vote";
    _checks = [
        [
            [_name, "started", format ["without at least %1 players", GVAR(vote_amount_players)]],
            count call FUNC(common,players),
            GVAR(vote_amount_players)
        ] call FUNC(helper,greaterThan),

        [
            [_name, "started"],
            player getVariable QGVAR(vote_cooldown)
        ] call FUNC(helper,timeExceeded),

        [
            _name,
            X_JIPH getVariable QGVAR(vote_progress)
        ] call FUNC(helper,inProgress)
    ];

    {
        if ([typeName _x, "STRING"] call BIS_fnc_areEqual) exitWith {
            [_x] call FUNC(client,hint);
        };
    } forEach _checks;

    if ({[_x, true] call BIS_fnc_areEqual} count _checks < count _checks) exitWith {
        closeDialog 0;
    };

    DIALOG("X_VOTE_DIALOG", 300) ctrlShow false;
    DIALOG("X_VOTE_DIALOG", 301) ctrlShow false;
    DIALOG("X_VOTE_DIALOG", 500) ctrlShow false;

    X_JIPH setVariable [QGVAR(vote_call), true, true];

    if !(isServer) then {
        [gameLogic, "execVM", [_this, __function(create)]] call FUNC(network,mp);
    };
};

if (isServer && {X_JIPH getVariable QGVAR(vote_call)}) then {
    private ["_time"];

    X_JIPH setVariable [QGVAR(vote), _format, true];
    X_JIPH setVariable [QGVAR(vote_call), false, true];
    X_JIPH setVariable [QGVAR(vote_progress), true, true];
    X_JIPH setVariable [QGVAR(vote_players), call FUNC(THIS_MODULE,count), true];

    gameLogic setVariable [QGVAR(vote), ((_types select 1) select _subtype) select 1];

    [true, "spawn", [[_format], {
        if !(hasInterface) exitWith {};

        GVAR(vote) = true;

        ["new", _this select 0] call FUNC(THIS_MODULE,hint);

        [false] call FUNC(THIS_MODULE,refresh);
    }]] call FUNC(network,mp);

    __log format ["Started %1", _format]];

    _time = GVAR(vote_time_delay) + call FUNC(common,time);

    while {call FUNC(common,time) < _time} do {
        private ["_remaining"];

        _remaining = floor (_time - call FUNC(common,time));

        // remaining time is greater than the maximum it could ever be
        if (_remaining > GVAR(vote_time_delay)) exitWith {
            __log format ["Time exceeded possible maximum, exiting %1", str [_time, _time - call FUNC(common,time)]]];
        };

        if (_remaining > 30 && {call FUNC(THIS_MODULE,valid)}) exitWith {
            sleep 30;

            if !(call FUNC(THIS_MODULE,valid)) then {
                ["cancel"] call FUNC(THIS_MODULE,complete);
            };
        };

        if (_remaining < 65 && {!(gameLogic getVariable QGVAR(vote_reminded))}) then {
            gameLogic setVariable [QGVAR(vote_reminded), true];

            [true, "execVM", [["countdown", _format], FUNCTION(THIS_MODULE,hint)]] call FUNC(network,mp);
        };

        sleep 5;
    };

    (switch (call FUNC(THIS_MODULE,valid)) do {
        case true: {["pass"]};
        case false: {["fail"]};
    }) call FUNC(THIS_MODULE,complete);
};