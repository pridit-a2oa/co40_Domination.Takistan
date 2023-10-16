/**
 * Damage Module - Vehicle Submodule
 */

#define THIS_MODULE damage
#include "x_macros.sqf"
private ["_vehicle"];

PARAMS_1(_vehicle);

if (isServer) then {
    _vehicle setVariable [QGVAR(structure), 0, true];
};

_vehicle addEventHandler ["HandleDamage", {
    private ["_unit", "_selection", "_damage", "_injurer", "_projectile"];

    PARAMS_5(_unit, _selection, _damage, _injurer, _projectile);

    switch (true) do {
        case !(alive _unit);
        case ({isPlayer _x} count crew _unit > 0 && {isPlayer _injurer});
        case (_unit distance (getMarkerPos QGVAR(base_south)) < 500 && {{side _x in [east, civilian]} count crew _unit < 1}): {
            _damage = 0;
        };
 
        case ([_projectile, "M_Igla_AA"] call BIS_fnc_areEqual): {
            _damage = [
                _unit,
                _damage,
                _selection,
                2,
                true
            ] call FUNC(THIS_MODULE,modifier);
        };

        case (_projectile in ["M_Hellfire_AT", "M_Maverick_AT"] && {_unit isKindOf "LandVehicle"}): {
            private ["_distance", "_falloff", "_modifier"];

            _distance = _unit distance _injurer;
            _falloff = ((ceil (_distance / 1000)) max 1) min 5;

            if (_falloff in [1, 2]) exitWith {};

            _modifier = round (100 / _falloff);

            {
                if (isPlayer _x) then {
                    [_x, "hintSilent", parseText format [
                        "Guided missile applied <t underline='1'>%1</t> of its potential damage, as you are >%2km away",
                        str _modifier + "%",
                        _falloff - 1
                    ]] call FUNC(network,mp);
                };
            } forEach units _injurer;

            _damage = [
                _unit,
                _damage,
                _selection,
                _modifier / 100,
                true
            ] call FUNC(THIS_MODULE,modifier);
        };
    };

    if (!isNull (driver _unit) && {isPlayer (driver _unit) && {!([_projectile, ""] call BIS_fnc_areEqual)}}) then {
        if ([getText (configFile >> "CfgAmmo" >> _projectile >> "simulation"), "shotShell"] call BIS_fnc_areEqual) exitWith {};

        _damage = [
            _unit,
            _damage,
            _selection,
            (driver _unit) getVariable QGVAR(damage_vehicle),
            true
        ] call FUNC(THIS_MODULE,modifier);
    };

    _damage
}];