#define THIS_MODULE intel
#include "x_macros.sqf"
private ["_car"];

PARAMS_1(_car);

_type = GVAR(intel_type_targets) call BIS_fnc_selectRandom;

[true, "say", [_car, QGVAR(sound_shuffle), 20]] call FUNC(network,mp);

sleep 2;

GVAR(crossroad) kbTell [GVAR(crossroad2), "intel", "Target", ["1", {}, _type, []], true];

sleep 2;

deleteVehicle (driver _car);
deleteVehicle _car;

[_type] call FUNC(THIS_MODULE,type);