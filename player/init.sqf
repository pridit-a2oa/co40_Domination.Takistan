/**
 * Player Module (Core)
 */

#define THIS_MODULE player
#include "x_macros.sqf"
if (!X_CLIENT) exitWith {};
if (!isNil QGVAR(jip_started)) exitWith {};

GVAR(jip_started) = true;

// Modules
__module(ammobox);
__module(backpacks);
__module(base_shield);
__module(perks);

deleteVehicle GVAR(client_init_trig);
GVAR(client_init_trig) = nil;

0 spawn {
    if (isMultiplayer) then {
        waitUntil {sleep 0.112;!isNil QGVAR(preloaddone)};
        sleep 0.01;
        1 fadeSound 1;
        titleText ["", "BLACK IN", 4];
    };
};