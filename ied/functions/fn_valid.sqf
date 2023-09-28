#define THIS_MODULE ied
#include "x_macros.sqf"
private ["_units", "_ied", "_detonate"];

PARAMS_2(_units, _ied);

if ({_x getVariable QGVAR(ied) && {_x distance _ied <= 50}} count (call FUNC(common,players)) > 0) exitWith {false};

_detonate = [];

{
    switch (true) do {
        case ((position _x) select 2 > 1);
        case !({isPlayer _x} count crew _x > 0): {};

        default {
            [
                _detonate,
                switch (true) do {
                    case (abs (speed _x) > GVAR(ied_trigger_speed));
                    case (_x distance _ied <= (GVAR(ied_trigger_distances) select 0)): {
                        true
                    };

                    default {
                        false
                    };
                }
            ] call BIS_fnc_arrayPush;
        };
    };
} forEach _units;

if ({[_x, true] call BIS_fnc_areEqual} count _detonate > 0) exitWith {true};

false