#define THIS_MODULE vehicle_lift
#include "x_macros.sqf"
private ["_lifter", "_type", "_nearest"];

_lifter = _this select 0;

if !(isEngineOn _lifter) exitWith {false};
if !(isNull (_lifter getVariable QGVAR(attached))) exitWith {false};
if (hasInterface && {!([player, driver _lifter] call BIS_fnc_areEqual)}) exitWith {false};

_type = call FUNC(THIS_MODULE,type);

_nearest = (nearestObjects [position _lifter, _type select 0, GVAR(vehicle_lift_distance) * 3]) - [_lifter];

if ([_nearest, []] call BIS_fnc_areEqual) exitWith {false};

_nearest = _nearest select 0;

if (_nearest isKindOf "ATV_Base_EP1") exitWith {false};
if (alive _nearest && {locked _nearest}) exitWith {false};
if ({alive _x && {!isPlayer _x}} count crew _nearest > 0) exitWith {false};
if (alive _nearest && {(vectorUp _nearest) select 2 < 0.6}) exitWith {false};
if !([alive _nearest, _type select 1] call BIS_fnc_areEqual) exitWith {false};

if (hasInterface && {!isNil QMODULE(setting) && {[(player getVariable QGVAR(lift)) select 1, 10] call BIS_fnc_areEqual}}) then {
    private ["_angle"];

    4000 cutRsc ["XD_VehicleLiftDialog", "PLAIN"];

    DIALOG("X_VEHICLE_LIFT_DIALOG", 100) ctrlSetText ([typeOf _nearest] call FUNC(vehicle,name));
    DIALOG("X_VEHICLE_LIFT_DIALOG", 101) ctrlSetText format ["%1m", round (_lifter distance _nearest)];
    DIALOG("X_VEHICLE_LIFT_DIALOG", 200) ctrlSetText (getText (configFile >> "CfgVehicles" >> (typeOf _nearest) >> "picture"));

    _angle = [_lifter, _nearest] call BIS_fnc_relativeDirTo;
    _angle = _angle - (360 * (floor (_angle / 360)));

    {
        DIALOG("X_VEHICLE_LIFT_DIALOG", (_x select 0)) ctrlSetTextColor [
            1, 1, 1, if (_x select 1) then {1} else {0.25}
        ];
    } forEach [
        [300, _angle <= 60 || {_angle >= 300}],
        [301, _angle >= 120 && {_angle <= 240}],
        [302, _angle >= 200 && {_angle <= 330}],
        [303, _angle >= 30 && {_angle <= 160}]
    ];

    DIALOG("X_VEHICLE_LIFT_DIALOG", 304) ctrlSetTextColor [1, 1, 1, 0.25];
};

if (speed _lifter > GVAR(vehicle_lift_speed)) exitWith {false};
if (_lifter distance _nearest > GVAR(vehicle_lift_distance)) exitWith {false};
if ((position _lifter) select 2 > GVAR(vehicle_lift_distance)) exitWith {false};

if (hasInterface && {!isNil QMODULE(setting) && {[(player getVariable QGVAR(lift)) select 1, 10] call BIS_fnc_areEqual}}) then {
    DIALOG("X_VEHICLE_LIFT_DIALOG", 304) ctrlSetTextColor [1, 1, 1, 1];
};

_nearest