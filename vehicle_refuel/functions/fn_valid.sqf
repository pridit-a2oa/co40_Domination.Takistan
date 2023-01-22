#include "x_macros.sqf"
private ["_target"];

PARAMS_1(_target);

if (GVAR(refuelling)) exitWith {false};
if (!isNil QMODULE(inventory_refuel) && {player getVariable QGVAR(inventory_refuel) < 1}) exitWith {false};
if (!alive _target) exitWith {false};
if (!(vehicle player == player)) exitWith {false};
if !(simulationEnabled _target) exitWith {false};
if (player distance _target > 10) exitWith {false};
if (count crew _target > 0 && {{!isPlayer _x} count crew _target > 0}) exitWith {false};
if (fuel _target > 0.33) exitWith {false};

true