/**
 * Core Module - Client
 */

#define THIS_MODULE client
#include "x_macros.sqf"

GVAR(perframe_store) = "HeliHEmpty" createVehicleLocal [0,0,0];
GVAR(perframe_array) = [];
GVAR(perframe_previous) = -999;

__ccppfln(core\THIS_MODULE\functions\fn_addPerFrame.sqf);
__ccppfln(core\THIS_MODULE\functions\fn_perFrame.sqf);
__ccppfln(core\THIS_MODULE\functions\fn_removePerFrame.sqf);

__ccppfln(core\THIS_MODULE\modules.sqf);

onEachFrame {call d_fnc_client_perFrame};

["init_vecs", {
    {
        [_x] __module(vehicle);
    } forEach vehicles;
    
    ["init_vecs"] call FUNC(THIS_MODULE,removePerFrame)
}, 0] call FUNC(THIS_MODULE,addPerFrame);

0 spawn {
    if (isMultiplayer) then {
        waitUntil {sleep 0.112;!isNil QGVAR(preloaddone)};
        sleep 0.01;
        1 fadeSound 1;
        titleText ["", "BLACK IN", 4];
    };
};

deleteVehicle GVAR(client_init_trig);
GVAR(client_init_trig) = nil;