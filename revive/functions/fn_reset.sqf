#include "x_macros.sqf"
private ["_unit"];

PARAMS_1(_unit);

showHUD true;

_unit setCaptive false;

_unit setVariable [QGVAR(unconscious), false, true];
_unit setVariable [QGVAR(reviving), false, true];

if (!isNil QMODULE(drag)) then {
    _unit setVariable [QGVAR(dragging), false, true];
};

if ([_unit, player] call BIS_fnc_areEqual) exitWith {
    39672 cutRsc ["Default", "PLAIN"];
};

[_unit, "cutRsc", [39672, ["Default", "PLAIN"]]] call FUNC(network,mp);