#include "x_macros.sqf"
private ["_object"];

PARAMS_1(_object);

_object addEventHandler ["HandleDamage", {
    if ((_this select 4) in GVAR(mission_main_type_projectiles)) exitWith {0};
    if (true in [(_this select 3) isKindOf "Car", (_this select 3) isKindOf "Tank"] && {(_this select 3) distance (_this select 0) > 150}) exitWith {0};
    if ((_this select 3) isKindOf "Air" && {!([_this select 4, "Bo_"] call KRON_StrInStr)} && {(_this select 3) distance (_this select 0) > 300}) exitWith {0};

    _this select 2
}];