#include "x_macros.sqf"
private ["_name", "_type"];

PARAMS_2(_name, _type);

if ({alive _x && {_x getVariable QGVAR(caller) == getPlayerUID player}} count (entities (_type select 1)) > 0) exitWith {
    format [
        "%1 cannot be %2 as you already have one %3 active in the field",
        _name select 0,
        _name select 1,
        [_type select 1] call FUNC(vehicle,name)
    ];
};

true