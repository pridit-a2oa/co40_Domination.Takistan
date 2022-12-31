#include "x_macros.sqf"
private ["_entities", "_speech", "_arguments", "_network", "_parameters"];

PARAMS_2(_entities, _speech);

_arguments = [_this, 2, []] call FUNC(common,param);
_network = [_this, 3, false] call FUNC(common,param);

_parameters = [
    _entities select 1,
    _speech select 0,
    _speech select 1,
    if (count _arguments > 0) then {_arguments select 0} else {["", {}, "", []]},
    if (count _arguments > 1) then {_arguments select 1} else {["", {}, "", []]},
    if (count _arguments > 2) then {_arguments select 2} else {["", {}, "", []]},
    true
];

if (_network) exitWith {
    [_entities select 0, "kbTell", _parameters] call FUNC(network,mp);
};

(_entities select 0) kbTell _parameters;