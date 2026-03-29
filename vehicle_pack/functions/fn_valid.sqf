#include "x_macros.sqf"
private ["_vehicle", "_phase", "_animation"];

PARAMS_3(_vehicle, _phase, _animation);

if !(alive _vehicle) exitWith {false};
if (locked _vehicle) exitWith {false};
if !(simulationEnabled _vehicle) exitWith {false};
if !((_vehicle animationPhase _animation) in [0, 1]) exitWith {false};
if (hasInterface && {[_phase, 1] call BIS_fnc_areEqual && {(isEngineOn _vehicle || {!([{isPlayer _x} count crew _vehicle, 0] call BIS_fnc_areEqual)})}}) exitWith {
    [format ["%1 cannot be folded while active", [typeOf _vehicle] call FUNC(vehicle,name)]] call FUNC(client,hint);

    false
};

true