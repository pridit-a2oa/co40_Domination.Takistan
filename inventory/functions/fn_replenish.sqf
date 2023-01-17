#include "x_macros.sqf"
private ["_type"];

PARAMS_1(_type);

player setVariable [
    format ["d_%1", _type],
    player getVariable (format ["d_%1_max", _type]),
    true
];

[true, "say3D", [player, QGVAR(sound_shuffle), 20]] call FUNC(network,mp);