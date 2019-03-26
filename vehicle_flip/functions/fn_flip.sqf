#include "x_macros.sqf"
PARAMS_1(_vehicle);

[_vehicle, surfaceNormal position _vehicle] call FUNC(network,setVectorUp);

[nil, _vehicle, rSAY, QGVAR(sound_flip), 20] call RE;