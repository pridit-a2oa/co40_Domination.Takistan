/**
 * Core Module - Client
 */

#define THIS_MODULE client
#include "x_macros.sqf"

player disableConversation true;

GVAR(perframe_store) = "HeliHEmpty" createVehicleLocal [0,0,0];
GVAR(perframe_array) = [];
GVAR(perframe_previous) = -999;

__cppfln(FUNC(THIS_MODULE,addPerFrame),core\THIS_MODULE\functions\fn_addPerFrame.sqf);
__cppfln(FUNC(THIS_MODULE,dirTo),core\THIS_MODULE\functions\fn_dirTo.sqf);
__cppfln(FUNC(THIS_MODULE,mandoChute),core\THIS_MODULE\functions\fn_mandoChute.sqf);
__cppfln(FUNC(THIS_MODULE,numbersToWords),core\THIS_MODULE\functions\fn_numbersToWords.sqf);
__cppfln(FUNC(THIS_MODULE,perFrame),core\THIS_MODULE\functions\fn_perFrame.sqf);
__cppfln(FUNC(THIS_MODULE,removePerFrame),core\THIS_MODULE\functions\fn_removePerFrame.sqf);
__cppfln(FUNC(THIS_MODULE,taskHint),core\THIS_MODULE\functions\fn_taskHint.sqf);

0 spawn {
    sleep 0.01;
    1 fadeSound 1;
    titleText ["", "BLACK IN", 4];
};

onEachFrame {call d_fnc_client_perFrame};

if (!isNil QMODULE(vehicle)) then {
    ["init_vehicles", {
        {
            [_x] __handler("vehicle");
        } forEach vehicles;

        ["init_vehicles"] call FUNC(THIS_MODULE,removePerFrame)
    }, 0] call FUNC(THIS_MODULE,addPerFrame);
};

["init_objects", {
    if (!isNil QMODULE(ammobox)) then {
        {
            [_x] __handler("ammobox");
        } forEach (allMissionObjects GVAR(ammobox_type));
    };

    if (!isNil QMODULE(vehicle_mhq)) then {
        {
            _x addEventHandler ["HandleDamage", {0}];
        } forEach (allMissionObjects GVAR(vehicle_mhq_net));
    };

    ["init_objects"] call FUNC(THIS_MODULE,removePerFrame)
}, 0] call FUNC(THIS_MODULE,addPerFrame);

player addEventHandler ["respawn", {
    (_this select 0) setDir 240.214;
    
    if (!isNil QMODULE(perk)) then {
        __handler("perk");
    };
    
    if (!isNil QMODULE(option)) then {
        __handler("option");
    };
    
    if (!isNil QMODULE(loadout) && {count GVAR(loadout) > 0}) then {
        call FUNC(loadout,restore);
    };
}];

deleteVehicle GVAR(client_init_trig);
GVAR(client_init_trig) = nil;