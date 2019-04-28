/**
 * Vehicle Module (Handler)
 */

#define THIS_MODULE vehicle
#include "x_macros.sqf"
private ["_vehicle"];
PARAMS_1(_vehicle);

if (isNil {_vehicle getVariable QGVAR(position)}) then {
    _vehicle setVariable [QGVAR(position), position _vehicle, true];
    _vehicle setVariable [QGVAR(direction), getDir _vehicle];
};

if (isServer) then {
    if (!isNil QMODULE(vehicle_respawn)) then {
        [_vehicle] __submodule(vehicle_respawn);
    };
    
    if (!isNil QMODULE(vehicle_mhq)) then {
        [_vehicle] __submodule(vehicle_mhq);
    };
};

if (hasInterface) then {    
    if (!isNil QMODULE(marker)) then {
        [_vehicle] __submodule(marker);
    };
    
    if (!isNil QMODULE(option)) then {
        [_vehicle] __submodule(option);
    };
    
    if (!isNil QMODULE(perk)) then {
        [_vehicle] __submodule(perk);
    };
    
    if (!isNil QMODULE(halo)) then {
        [_vehicle] __submodule(halo);
    };
    
    if (!isNil QMODULE(vehicle_flip)) then {
        [_vehicle] __submodule(vehicle_flip);
    };
    
    if (!isNil QMODULE(vehicle_bonus)) then {
        [_vehicle] __submodule(vehicle_bonus);
    };
    
    if (!isNil QMODULE(vehicle_service)) then {
        [_vehicle] __submodule(vehicle_service);
    };
    
    if (!isNil QMODULE(vehicle_protection)) then {
        [_vehicle] __submodule(vehicle_protection);
    };
    
    if (!isNil QMODULE(vehicle_menu)) then {
        [_vehicle] __submodule(vehicle_menu);
    };
    
    if (_vehicle isKindOf "Helicopter" || {typeOf _vehicle == "MV22"}) then {
        if (!isNil QMODULE(vehicle_welcome)) then {
            [_vehicle] __submodule(vehicle_welcome);
        };
        
        if (!isNil QMODULE(vehicle_lift)) then {
            [_vehicle] __submodule(vehicle_lift);
        };
    };
};