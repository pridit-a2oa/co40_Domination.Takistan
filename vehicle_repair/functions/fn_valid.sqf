#include "x_macros.sqf"
private ["_target"];

PARAMS_1(_target);

if (GVAR(repairing)) exitWith {false};
if (!isNil QMODULE(inventory_repair) && {player getVariable QGVAR(inventory_repair) < 1}) exitWith {false};
if (!alive _target) exitWith {false};
if (!(vehicle player == player)) exitWith {false};
if (player distance _target > 10) exitWith {false};
if !(simulationEnabled _target) exitWith {false};
if (count crew _target > 0 && {{!isPlayer _x} count crew _target > 0}) exitWith {false};
if (animationState player == "acrgpknlmstpsnonwnondnon_amovpercmstpsnonwnondnon_getouthigh") exitWith {false};

if (!canMove _target || {damage _target > GVAR(vehicle_repair_amount_damage)} || {fuel _target < GVAR(vehicle_repair_amount_fuel)}) exitWith {
    true
};

false