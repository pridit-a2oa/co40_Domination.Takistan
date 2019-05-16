/**
 * Vehicle Module (Handler)
 */

#define THIS_MODULE vehicle
#include "x_macros.sqf"
private ["_vehicle"];

PARAMS_1(_vehicle);

if (isNil {_vehicle getVariable QGVAR(position)}) then {
    _vehicle setVariable [QGVAR(position), position _vehicle, true];
    _vehicle setVariable [QGVAR(direction), getDir _vehicle, true];
};

if (isServer) then {
    clearMagazineCargoGlobal _vehicle;
    clearWeaponCargoGlobal _vehicle;

    if (!isNil QMODULE(vehicle_respawn)) then {
        [_vehicle] __submoduleVM(vehicle_respawn);
    };
};

if (hasInterface) then {
    if (!isNil QMODULE(halo)) then {
        [_vehicle] __submoduleVM(halo);
    };
    
    if (!isNil QMODULE(perk)) then {
        [_vehicle] __submoduleVM(perk);
    };
    
    if (!isNil QMODULE(option)) then {
        [_vehicle] __submoduleVM(option);
    };
    
    if (!isNil QMODULE(vehicle_bonus)) then {
        [_vehicle] __submoduleVM(vehicle_bonus);
    };
    
    if (!isNil QMODULE(vehicle_flip)) then {
        [_vehicle] __submoduleVM(vehicle_flip);
    };
    
    if (!isNil QMODULE(vehicle_lift)) then {
        [_vehicle] __submoduleVM(vehicle_lift);
    };
    
    if (!isNil QMODULE(vehicle_marker)) then {
        [_vehicle] __submoduleVM(vehicle_marker);
    };
    
    if (!isNil QMODULE(vehicle_menu)) then {
        [_vehicle] __submoduleVM(vehicle_menu);
    };
    
    if (!isNil QMODULE(vehicle_protection)) then {
        [_vehicle] __submoduleVM(vehicle_protection);
    };
    
    if (!isNil QMODULE(vehicle_repair)) then {
        [_vehicle] __submoduleVM(vehicle_repair);
    };
    
    if (!isNil QMODULE(vehicle_welcome)) then {
        [_vehicle] __submoduleVM(vehicle_welcome);
    };
    
    if (!isNil QMODULE(vehicle_wreck)) then {
        [_vehicle] __submoduleVM(vehicle_wreck);
    };
};

if (!isNil QMODULE(vehicle_load)) then {
    [_vehicle] __submoduleVM(vehicle_load);
};

if (!isNil QMODULE(vehicle_mhq)) then {
    [_vehicle] __submoduleVM(vehicle_mhq);
};

if (!isNil QMODULE(vehicle_tow)) then {
    [_vehicle] __submoduleVM(vehicle_tow);
};

_vehicle addEventHandler ["killed", {
    private ["_vehicle"];
    
    PARAMS_1(_vehicle);
    
    [_vehicle] spawn {
        private ["_vehicle"];
        
        PARAMS_1(_vehicle);
        
        sleep 1;
        
        [_vehicle] call FUNC(THIS_MODULE,freeze);
    };
}];