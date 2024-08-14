#define THIS_MODULE vote
#include "x_macros.sqf"
private ["_state", "_type"];

PARAMS_2(_state, _type);

if (!isNil QMODULE(setting) && {[(player getVariable QGVAR(vote)) select 1, 0] call BIS_fnc_areEqual} && {!(["pass", _state] call BIS_fnc_areEqual)}) exitWith {};

switch (_state) do {
    case "cancel": {
        taskHint [
            format ["Vote Cancelled:\n%1", _type],
            [0.972549, 0.121568, 0.000000, 1.000000],
            "taskFailed"
        ];
    };

    case "countdown": {
        private ["_params"];

        _params = [
            format ["Vote Ending:\n%1", _type],
            [0.639, 0.682, 0.333, 1.000000],
            "taskNew"
        ];

        for "_i" from 0 to 1 do {
            if ([_i, 1] call BIS_fnc_areEqual) then {
                _params set [0, format [
                    "%1\n1 Minute Left",
                    _params select 0
                ]];
            };

            taskHint _params;
        };
    };

    case "fail": {
        taskHint [
            format ["Vote Failed:\n%1", _type],
            [0.972549, 0.121568, 0.000000, 1.000000],
            "taskFailed"
        ];
    };

    case "new": {
        private ["_params"];

        _params = [
            "Vote Started",
            [0.325, 0.596, 0.714, 1.000000],
            "taskNew"
        ];

        for "_i" from 0 to 2 do {
            if ([_i, 1] call BIS_fnc_areEqual) then {
                _params set [0, format [
                    "%1:\n%2",
                    _params select 0,
                    _type
                ]];
            };

            if ([_i, 2] call BIS_fnc_areEqual) then {
                _params set [0, format [
                    "%1\n%2",
                    _params select 0,
                    format ["%1 Votes Required", call FUNC(THIS_MODULE,count)]
                ]];
            };

            taskHint _params;
        };
    };

    case "pass": {
        taskHint [
            format ["Vote Success:\n%1", _type],
            [0.600000, 0.839215, 0.466666, 1.000000],
            "taskDone"
        ];
    };
};