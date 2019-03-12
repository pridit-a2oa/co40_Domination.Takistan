/**
 * Core Module - Client
 */

#define THIS_MODULE client
#include "x_macros.sqf"

if (!X_CLIENT) exitWith {};
if (!isNil QGVAR(jip_started)) exitWith {};

GVAR(jip_started) = true;
GVAR(prevPFrame) = -999;
GVAR(perframe_store) = GVAR(HeliHEmpty) createVehicleLocal [0,0,0];
GVAR(perframe_array) = [];

__ccppfln(core\THIS_MODULE\functions.sqf);
__ccppfln(core\THIS_MODULE\modules.sqf);

onEachFrame {call d_fnc_player_perFrame};

["init_vecs", {
    {
        _x __module(vehicle);
    } forEach vehicles;
    
    ["init_vecs"] call FUNC(THIS_MODULE,removePerFrame)
}, 0] call FUNC(THIS_MODULE,addPerFrame);

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