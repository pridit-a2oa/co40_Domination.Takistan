/**
 * Vehicle Service Module - Vehicle Marker Submodule
 */

#include "x_macros.sqf"
private ["_vehicle", "_marker"];

PARAMS_1(_vehicle);

if (GVAR(vehicle_mhq_types) find (typeOf _vehicle) == -1) exitWith {};

_marker = _vehicle getVariable QGVAR(id);
_marker setMarkerTypeLocal (switch (true) do {
    case ((faction _vehicle) in ["USMC", "BIS_US", "BIS_BAF"]): {"b_support"};
    case ((faction _vehicle) in ["BIS_TK", "BIS_TK_INS"]): {"o_support"};
    default {"n_support"};
});