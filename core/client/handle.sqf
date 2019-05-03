/**
 * Core Module - Client (Handler)
 */

#define THIS_MODULE client
#include "x_macros.sqf"

player disableConversation true;

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

if (!isNil QMODULE(ammobox)) then {
    ["init_ammobox", {
        {
            [_x] __handler("ammobox");
        } forEach (allMissionObjects GVAR(ammobox_type));

        ["init_ammobox"] call FUNC(THIS_MODULE,removePerFrame)
    }, 0] call FUNC(THIS_MODULE,addPerFrame);
};

if (!isNil QMODULE(ied)) then {
    ["init_ied", {
        {
            {
                [_x] call FUNC(ied,trigger);
            } forEach (allMissionObjects _x);
        } forEach GVAR(ied_type_objects);

        ["init_ied"] call FUNC(THIS_MODULE,removePerFrame)
    }, 0] call FUNC(THIS_MODULE,addPerFrame);
};

if (!isNil QMODULE(construction)) then {
    ["init_objects", {
        {
            _name = _x select 0;
            _type = _x select 1;
            
            {
                [_name, _x] call FUNC(construction,action);
            } forEach (allMissionObjects _type);
        } forEach GVAR(construction_type_objects);

        ["init_objects"] call FUNC(THIS_MODULE,removePerFrame)
    }, 0] call FUNC(THIS_MODULE,addPerFrame);
};

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