/**
 * Vehicle Cargo Module - Vehicle Menu Submodule
 */

#define THIS_MODULE vehicle_cargo
#include "x_macros.sqf"
private ["_vehicle", "_store", "_cargo"];

PARAMS_1(_vehicle);

if !([_vehicle] call FUNC(THIS_MODULE,valid)) exitWith {false};
if (isNil {_vehicle getVariable QGVAR(cargo)}) exitWith {false};

_store = GVAR(vehicle_cargo_types) select (([GVAR(vehicle_cargo_types), typeOf _vehicle] call BIS_fnc_findNestedElement) select 0) select 1;

_cargo = _vehicle getVariable QGVAR(cargo);

for "_i" from 0 to ((_store select 1) - 1) do {
    private ["_load"];

    _load = [_cargo, _i, objNull] call FUNC(common,param);

    if !([_load, objNull] call BIS_fnc_areEqual) then {
        [
            format [
                "Cargo: Unload %1",
                [typeOf (_load select 0)] call FUNC(vehicle,name)
            ],
            format ["[""cargo_unload"", %1]", _i]
        ] call FUNC(menu,populate);
    };
};

if !([count _cargo, _store select 1] call BIS_fnc_areEqual) then {
    private ["_entity"];

    _entity = [_vehicle, _store select 0] call FUNC(THIS_MODULE,entity);

    if ([_entity, objNull] call BIS_fnc_areEqual) exitWith {};

    [
        format [
            "Cargo: Load %1",
            [typeOf _entity] call FUNC(vehicle,name)
        ],
        format ["[""cargo_load"", ""%1""]", typeOf _entity]
    ] call FUNC(menu,populate);
};

true