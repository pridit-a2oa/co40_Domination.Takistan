#include "x_macros.sqf"
private ["_message", "_timer", "_graceful", "_stylized"];

PARAMS_1(_message);

_timer = [_this, 1, 10] call FUNC(common,param);
_graceful = [_this, 2, true] call FUNC(common,param);
_stylized = [_this, 3, false] call FUNC(common,param);

if (_graceful) then {
    player enableSimulation false;

    titleText ["", "BLACK", 1];
};

sleep 1;

for "_i" from -abs(_timer) to -1 do {
    titleText [
        format [
            "%1\n\n%2",
            _message,
            if (_stylized) then {
                private ["_progress"];

                _progress = [91];

                for "_i" from abs(_i) + 1 to _timer do {[_progress, 47] call BIS_fnc_arrayPush};
                for "_i" from 2 to abs(_i) do {[_progress, 820] call BIS_fnc_arrayPush};

                [_progress, 93] call BIS_fnc_arrayPush;

                toString _progress
            } else {
                abs _i
            }
        ],
        "BLACK FADED"
    ];

    sleep 1;
};

if (_graceful) then {
    player enableSimulation true;

    titleText ["", "BLACK IN", 2];
};