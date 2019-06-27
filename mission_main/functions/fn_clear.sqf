#include "x_macros.sqf"
private ["_target", "_man", "_armor"];

PARAMS_1(_target);

_man = _target nearEntities [["Man", "StaticWeapon"], GVAR(mission_main_radius_zone)];
_armor = _target nearEntities [["Tank", "Wheeled_APC"], GVAR(mission_main_radius_zone)];

if ({!isPlayer _x && {{alive _x && {!isPlayer _x}} count crew _x > 0}} count _man > GVAR(mission_main_threshold_infantry)) exitWith {false};
if ({{alive _x && {!isPlayer _x}} count crew _x > 0} count _armor > GVAR(mission_main_threshold_armor)) exitWith {false};

if (_target getVariable QGVAR(camps) > 0) exitWith {false};
if (_target getVariable QGVAR(radios) > 0) exitWith {false};

true