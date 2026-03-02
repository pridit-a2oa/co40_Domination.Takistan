#define THIS_MODULE accolade
#include "x_macros.sqf"
private ["_unit", "_position", "_type", "_animations", "_loop", "_expression"];

PARAMS_3(_unit, _position, _type);

_animations = call compile format ["d_%1_%2_animations", QUOTE(THIS_MODULE), _type];

if ([_animations, []] call BIS_fnc_areEqual) exitWith {};

_loop = [_this, 3, if ([count _animations, 2] call BIS_fnc_areEqual) then {_animations select 1} else {false}] call FUNC(common,param);

if ([typeName (_animations select 0), "STRING"] call BIS_fnc_areEqual) then {
    _animations set [0, [_animations select 0]];
};

_expression = {
    [true, "switchMove", [_unit, (_animations select 0) select _this]] call FUNC(network,mp);
    // [true, "playMoveNow", [_unit, (_animations select 0) select _this]] call FUNC(network,mp);
};

if (_loop) exitWith {
    while {true} do {
        private ["_animation", "_move"];

        _animation = animationState _unit;

        waitUntil {
            sleep 0.5;

            !([{_x distance _unit < 200} count (call FUNC(common,players)), 0] call BIS_fnc_areEqual) && {!([_animation, animationState _unit] call BIS_fnc_areEqual) || {_unit distance _position > 0.3}}
        };

        if (_unit distance _position > 0.3) then {
            _unit setPos _position;
        };

        (floor (random (count (_animations select 0)))) call _expression;
    };
};

0 call _expression;