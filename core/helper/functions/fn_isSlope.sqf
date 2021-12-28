#include "x_macros.sqf"
private ["_name", "_entity", "_threshold", "_degrees", "_pitch", "_bank"];

PARAMS_3(_name, _entity, _threshold);

_degrees = _entity call BIS_fnc_getPitchBank;

_pitch = round (abs (_degrees select 0));
_bank = round (abs (_degrees select 1));

if (_pitch > _threshold || {_bank > _threshold}) exitWith {
    format [
        "%1 cannot be %2 on a significant incline, move to more level terrain",
        _name select 0,
        _name select 1
    ];
};

true