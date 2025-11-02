#include "x_macros.sqf"
private ["_name", "_origin", "_position", "_distance", "_condition"];

PARAMS_4(_name, _origin, _position, _distance);

_condition = if ([count _distance, 3] call BIS_fnc_areEqual && {[_distance select 2, "within"] call BIS_fnc_areEqual}) then {
    (_origin distance _position > (_distance select 0))
} else {
    (_origin distance _position < (_distance select 0))
};

if (_condition) exitWith {
    format [
        "%1 can only be %2%5%3 %4",
        _name select 0,
        _name select 1,
        if (_distance select 0 < 1000) then {
            format ["%1m", _distance select 0]
        } else {
            format ["%1km", (_distance select 0) / 1000]
        },
        _distance select 1,
        if ([count _distance, 3] call BIS_fnc_areEqual) then {
            format [" %1 ", _distance select 2]
        } else {
            " "
        }
    ];
};

true