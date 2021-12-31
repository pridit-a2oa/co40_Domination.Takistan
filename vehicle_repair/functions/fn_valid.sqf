#include "x_macros.sqf"
private ["_target"];

PARAMS_1(_target);

if (GVAR(repairing)) exitWith {false};
if (player getVariable QGVAR(repair_kits) < 1) exitWith {false};

if (!alive _target) exitWith {false};
if (!(vehicle player == player)) exitWith {false};
if (count crew _target > 0 && {{!isPlayer _x} count crew _target > 0}) exitWith {false};

if (!canMove _target || {damage _target > GVAR(vehicle_repair_amount_damage)} || {fuel _target < GVAR(vehicle_repair_amount_fuel)}) exitWith {
    true
};

false