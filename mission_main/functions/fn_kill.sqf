#include "x_macros.sqf"
private ["_target", "_units"];

PARAMS_1(_target);

_units = _target getVariable QGVAR(units);

{
    if (alive _x) then {
        if (!([vehicle _x, _x] call BIS_fnc_areEqual) && {!((vehicle _x) isKindOf "StaticWeapon") && {count crew (vehicle _x) > 0 && {{!isPlayer _x} count crew (vehicle _x) > 0}}}) then {
            if (!isNil QMODULE(vehicle_wreck) && {(vehicle _x) getVariable QGVAR(wreckable)}) then {
                (vehicle _x) setVariable [QGVAR(wreckable), false, true];
            };

            (vehicle _x) setDamage 1;
        };

        _x setDamage 1;
    };
} forEach _units;

{
    deleteVehicle _x;
} forEach (_target getVariable QGVAR(triggers));