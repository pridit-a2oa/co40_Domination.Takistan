#include "x_macros.sqf"
private ["_name", "_time", "_format"];

PARAMS_2(_name, _time);

if (time < _time) exitWith {
    _format = switch (true) do {
        case (_time - time > 60): {
            "minutes"
        };

        case (_time - time > 1): {
            "seconds"
        };

        default {
            "second"
        };
    };

    _time = if ([_format, "minutes"] call BIS_fnc_areEqual) then {
        (_time - time) / 60
    } else {
        _time - time
    };

    format [
        "%1 cannot be %2 for %3 %4",
        _name select 0,
        _name select 1,
        ceil _time,
        _format
    ];
};

true