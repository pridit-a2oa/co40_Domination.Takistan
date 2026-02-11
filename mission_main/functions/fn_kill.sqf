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

if !(isNil QMODULE(marker)) then {
    {
        private ["_name"];

        _name = _x select 0;

        {
            [
                format ["%1_%2", _name, _x getVariable QGVAR(id)]
            ] call FUNC(marker,delete);
        } forEach (_x select 1);
    } forEach [
        ["camp", _target getVariable QGVAR(camps)],
        ["radio", _target getVariable QGVAR(radios)]
    ];
};