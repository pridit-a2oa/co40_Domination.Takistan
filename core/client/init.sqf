/**
 * Core Module - Client
 */

#define THIS_MODULE client
#include "x_macros.sqf"

GVAR(perframe_store) = "HeliHEmpty" createVehicleLocal [0,0,0];
GVAR(perframe_array) = [];
GVAR(perframe_previous) = -999;

__cppfln(FUNC(THIS_MODULE,addPerFrame),core\THIS_MODULE\functions\fn_addPerFrame.sqf);
__cppfln(FUNC(THIS_MODULE,perFrame),core\THIS_MODULE\functions\fn_perFrame.sqf);
__cppfln(FUNC(THIS_MODULE,removePerFrame),core\THIS_MODULE\functions\fn_removePerFrame.sqf);
__cppfln(FUNC(THIS_MODULE,taskHint),core\THIS_MODULE\functions\fn_taskHint.sqf);

__ccppfln(core\THIS_MODULE\modules.sqf);

onEachFrame {call d_fnc_client_perFrame};
enableRadio true;

if (!isNil QMODULE(vehicle)) then {
    ["init_vehicles", {
        {
            [_x] __module(vehicle);
        } forEach vehicles;
        
        ["init_vehicles"] call FUNC(THIS_MODULE,removePerFrame)
    }, 0] call FUNC(THIS_MODULE,addPerFrame);
};

["init_objects", {
    if (!isNil QMODULE(ammobox)) then {
        {
            [_x] __module(ammobox);
        } forEach (allMissionObjects "USVehicleBox_EP1");
    };
    
    if (!isNil QMODULE(vehicle_mhq)) then {
        {
            _x addEventHandler ["HandleDamage", {0}];
        } forEach (allMissionObjects "Land_CamoNetB_NATO_EP1");
    };
    
    ["init_objects"] call FUNC(THIS_MODULE,removePerFrame)
}, 0] call FUNC(THIS_MODULE,addPerFrame);

0 spawn {
    if (isMultiplayer) then {
        waitUntil {sleep 0.112;!isNil QGVAR(preloaddone)};
        sleep 0.01;
        1 fadeSound 1;
        titleText ["", "BLACK IN", 4];
    };
};

player addEventHandler ["respawn", {
    (_this select 0) setDir 240.214;
    
    if (!isNil QMODULE(perk)) then {
        __module(perk);
    };
    
    if (!isNil QMODULE(loadout)) then {
        call FUNC(loadout,restore);
    };
}];

deleteVehicle GVAR(client_init_trig);
GVAR(client_init_trig) = nil;