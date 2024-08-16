/**
 * Vehicle Marker - Vehicle Lift Submodule
 */

#include "x_macros.sqf"
private ["_attacher", "_attachee", "_attached", "_position", "_marker"];

PARAMS_2(_attacher, _attachee);

while {true} do {
    if ([_attachee, objNull] call BIS_fnc_areEqual) exitWith {};

    _attached = _attacher getVariable QGVAR(attached);
    _position = _attachee getVariable QGVAR(position);

    _marker = str (_position select 0);

    if (isNil "_attached" || {isNull _attached}) exitWith {
        _attachee setVariable [QGVAR(hidden), false, true];
    };

    if (!isNil "_position" && {!isNull _attached}) then {
        if ([markerAlpha _marker, 1] call BIS_fnc_areEqual) then {
            _attachee setVariable [QGVAR(hidden), true, true];
        };
    };

    sleep 5;
};