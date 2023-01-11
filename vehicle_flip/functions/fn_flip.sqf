#include "x_macros.sqf"
PARAMS_1(_vehicle);

[_vehicle, "setVectorUp", surfaceNormal position _vehicle] call FUNC(network,mp);

[true, "say3D", [_vehicle, QGVAR(sound_flip), 20]] call FUNC(network,mp);