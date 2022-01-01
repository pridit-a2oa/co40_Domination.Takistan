/**
 * Vehicle Abandon (Handler)
 */

#define THIS_MODULE vehicle_abandon
#include "x_macros.sqf"
private ["_abandon", "_position", "_distance", "_time"];

if (isServer) then {
    0 spawn {
        while {true} do {
            sleep 60;

            {
                _abandon = _x getVariable QGVAR(abandon);

                if (!isNil "_abandon" && {_abandon}) then {
                    if !([_x] call FUNC(THIS_MODULE,valid)) exitWith {};

                    _position = _x getVariable QGVAR(position);
                    _distance = _x getVariable QGVAR(distance);

                    if (isNil "_distance" || {!([(position _x) distance _position, _distance] call BIS_fnc_areEqual)}) then {
                        _x setVariable [QGVAR(distance), (position _x) distance _position];
                        _x setVariable [QGVAR(time), ([_x] call FUNC(THIS_MODULE,time)) + (call FUNC(common,time))];
                    };

                    _time = _x getVariable QGVAR(time);

                    if (!isNil "_time" && {_time < call FUNC(common,time)}) exitWith {
                        [_x] spawn FUNC(vehicle,delete);
                    };

                    sleep 1;
                };

                sleep 0.1;
            } forEach vehicles;
        };
    };
};