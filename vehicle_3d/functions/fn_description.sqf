#define THIS_MODULE vehicle_3d
#include "x_macros.sqf"
private ["_type", "_array", "_description"];

PARAMS_1(_type);

_array = [];

{
    if !(isNil format ["d_mdl_%1", _x]) then {
        [
            _array,
            [_type] call compile preprocessFileLineNumbers format [
                "%1\modules\%2.sqf",
                _x,
                QUOTE(THIS_MODULE)
            ]
        ] call BIS_fnc_arrayPushStack;
    };
} forEach [
    "inventory",
    "vehicle_ammobox",
    "vehicle_cargo",
    "vehicle_create",
    "vehicle_deploy",
    "vehicle_lift",
    "vehicle_ramp",
    "vehicle_uav"
];

if ([_array, []] call BIS_fnc_areEqual) exitWith {""};

_description = "";

{
    _description = _description + format ["<br />%1", _x]
} forEach ([_array] call KRON_ArraySort);

_description