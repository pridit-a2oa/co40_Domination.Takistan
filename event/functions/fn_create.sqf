#define THIS_MODULE event
#include "x_macros.sqf"
private ["_type", "_log", "_position", "_target", "_location"];

PARAMS_2(_type, _log);

while {isNil "_target" || {[typeName _target, "BOOL"] call BIS_fnc_areEqual}} do {
    _position = (call compile format [QUOTE(%1), format ["d_%1_%2_positions", QUOTE(THIS_MODULE), toLower _type]]) call BIS_fnc_selectRandom;

    _target = switch ([{(_x distance (_position select 0)) < GVAR(event_distance_create)} count (call FUNC(common,players)), 0] call BIS_fnc_areEqual) do {
        case true: {
            [_position] call (call compile format [
                "d_fnc_%1_%2_create",
                QUOTE(THIS_MODULE),
                toLower _type
            ]);
        };

        case false: {
            false
        };
    };

    sleep 5;
};

_location = "HeliHEmpty" createVehicleLocal (_position select 0);

_location setVariable [QGVAR(type), _type];
_location setVariable [QGVAR(position), _target select 0];
_location setVariable [QGVAR(objects), _target select 1];
_location setVariable [QGVAR(units), _target select 2];

{
    _x setVariable [QGVAR(target), _location];

    _x addEventHandler ["Killed", {
        private ["_unit", "_target", "_type", "_position", "_objects", "_units"];

        PARAMS_1(_unit);

        if ({alive _x} count units _unit > 1) exitWith {};

        _target = _unit getVariable QGVAR(target);

        if (isNull _target) exitWith {};

        {
            _x removeAllEventHandlers "Killed";
        } forEach units _unit;

        _type = _target getVariable QGVAR(type);
        _position = _target getVariable QGVAR(position);
        _objects = _target getVariable QGVAR(objects);
        _units = _target getVariable QGVAR(units);

        deleteVehicle _target;

        [_position, (_objects + _units)] spawn FUNC(THIS_MODULE,cleanup);

        _type spawn {
            sleep GVAR(event_time_delay);

            [_this, true] spawn FUNC(THIS_MODULE,create);
        };
    }];
} forEach (_target select 2);

if !(isNil "_log") then {
    __log format ["Generated %1", _type]];
};