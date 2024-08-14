#include "x_macros.sqf"
private ["_strike", "_shell", "_trail"];

PARAMS_1(_strike);

_shell = (getText (configFile >> "CfgAmmo" >> GVAR(artillery_type_shell) >> "ARTY_NetShell")) createVehicle _strike;
_trail = "#particlesource" createVehicle _strike;

[true, "spawn", [[_trail, _shell], {
    (_this select 1) setVelocity [0, 0, -150];

    (_this select 0) setParticleRandom [0.25, [0.002, 0.002, 0.002], [0, 0, 0], 0, 0, [0, 0, 0, 0], 0, 0];
    (_this select 0) setDropInterval 0.001;
    (_this select 0) setParticleParams [
        ["\ca\Data\ParticleEffects\Universal\Universal.p3d", 16, 13, 3, 0],
        "", "Billboard", 1, 2,
        [0,0,0], [0,0,0],
        0, 0.3, 0.1, 0.3,
        [0.4, 0.7],
        [[1, 1, 1, 0.5],[1, 1, 1, 0.25],[1, 1, 1, 0]], [1000], 100, 0, "", "", _this select 1, 0
    ];
}]] call FUNC(network,mp);

sleep 1;

deleteVehicle _shell;
deleteVehicle _trail;