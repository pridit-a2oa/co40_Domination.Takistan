/**
 * Vehicle Wreck Module - Vehicle Marker Submodule
 */

#include "x_macros.sqf"
private ["_vehicle", "_marker"];

PARAMS_2(_vehicle, _marker);

if (alive _vehicle) exitWith {_marker};
if !(_vehicle getVariable QGVAR(wreckable)) exitWith {_marker};

(_vehicle getVariable QGVAR(id)) setMarkerTypeLocal "DOT";

_marker set [0, [typeOf _vehicle] call FUNC(vehicle,name)];
_marker set [1, "Wreck"];
_marker set [2,
    switch (faction _vehicle) do {
        case "BIS_TK";
        case "BIS_TK_INS": {"Red"};
        default {"Blue"};
    }
];

_marker