#include "x_macros.sqf"
private ["_position", "_type", "_shell", "_trail"];

PARAMS_2(_position, _type);

_shell = (getText (configFile >> "CfgAmmo" >> _type >> "ARTY_NetShell")) createVehicle _position;
_trail = "#particlesource" createVehicle _position;

[true, "spawn", [[_shell, _trail], {
    (_this select 0) setVelocity [0, 0, -150];

    (_this select 1) setParticleRandom [0.25, [0.002, 0.002, 0.002], [0, 0, 0], 0, 0, [0, 0, 0, 0], 0, 0];
    (_this select 1) setDropInterval 0.0012;
    (_this select 1) setParticleParams [
        ["\ca\Data\ParticleEffects\Universal\Universal.p3d", 16, 13, 3, 0],
        "", "Billboard", 1, 2,
        [0,0,0], [0,0,0],
        0, 0.3, 0.1, 0.3,
        [0.4, 0.7],
        [[1, 1, 1, 0.5],[1, 1, 1, 0.25],[1, 1, 1, 0]], [1000], 100, 0, "", "", _this select 0, 0
    ];
}]] call FUNC(network,mp);

sleep 1;

deleteVehicle _shell;
deleteVehicle _trail;