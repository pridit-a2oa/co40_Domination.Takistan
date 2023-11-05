/**
 * Vehicle Wreck Module - Vehicle Marker Submodule
 */

#include "x_macros.sqf"
private ["_vehicle", "_marker", "_color"];

PARAMS_1(_vehicle);

if (alive _vehicle) exitWith {};
if !(_vehicle getVariable QGVAR(wreckable)) exitWith {};

_marker = _vehicle getVariable QGVAR(id);
_marker setMarkerPosLocal (getPosASL _vehicle);
_marker setMarkerTextLocal (format ["%1 Wreck", [typeOf (_vehicle)] call FUNC(vehicle,name)]);
_marker setMarkerTypeLocal "DOT";

_color = switch (faction _vehicle) do {
    case "BIS_TK": {"ColorRed"};
    case "BIS_TK_INS": {"ColorRed"};
    default {"ColorBlue"};
};

_marker setMarkerColorLocal _color;