/**
 * Original Authors: kylania & Tajin
 * https://forums.bohemia.net/forums/topic/77399-limiting-a-vehicles-speed/?tab=comments#comment-1349819
 */

#include "x_macros.sqf"
private ["_vehicle", "_limit", "_current", "_velocity", "_direction", "_speed"];

PARAMS_2(_vehicle, _limit);

_current = speed _vehicle;

if (_current > _limit) then {
    _velocity = velocity _vehicle;
    _direction = direction _vehicle;

    _speed = _current - _limit;

    _vehicle setVelocity [
        (_velocity select 0) / _current * _limit,
        (_velocity select 1) / _current * _limit,
        (_velocity select 2) / _current * _limit
    ];
};

sleep 0.1;