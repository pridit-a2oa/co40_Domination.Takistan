#include "x_macros.sqf"
private ["_target", "_units"];

PARAMS_1(_target);

_units = _target getVariable QGVAR(units);

{
    if (vehicle _x != _x && {!((vehicle _x) isKindOf "StaticWeapon")} && {count crew (vehicle _x) > 0} && {{!isPlayer _x} count crew (vehicle _x) > 0}) then {
        (vehicle _x) setDamage 1;

        if (!isNil QMODULE(vehicle_wreck) && {(vehicle _x) getVariable QGVAR(wreckable)}) exitWith {};

        if (!isNil QMODULE(vehicle_marker)) then {
            [true, "deleteMarkerLocal", (vehicle _x) getVariable QGVAR(id)] call FUNC(network,mp);
        };
    };

    _x setDamage 1;
} forEach _units;