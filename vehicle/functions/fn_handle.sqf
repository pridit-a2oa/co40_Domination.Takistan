#define THIS_MODULE vehicle
#include "x_macros.sqf"
private ["_vehicle"];

PARAMS_1(_vehicle);

if (_vehicle isKindOf "StaticWeapon") exitWith {};
if (_vehicle isKindOf "Thing" && {!(_vehicle isKindOf "Wreck")}) exitWith {};

if (isNil {_vehicle getVariable QGVAR(position)}) then {
    _vehicle setVariable [QGVAR(position), position _vehicle, true];
    _vehicle setVariable [QGVAR(direction), getDir _vehicle, true];
};

if (isServer) then {
    clearMagazineCargoGlobal _vehicle;
    clearWeaponCargoGlobal _vehicle;

    if (sunOrMoon == 0 && {_vehicle isKindOf "Air"}) then {
        gameLogic action ["lightOn", _vehicle];
    };

    if (isNil {_vehicle getVariable QGVAR(built)}) then {
        _vehicle setVariable [QGVAR(built), false, true];
    };
    
    if (isNil {_vehicle getVariable QGVAR(spawn)}) then {
        _vehicle setVariable [QGVAR(spawn), position _vehicle, true];
    };
    
    if (!isNil QMODULE(vehicle_menu)) then {
        if (isNil {_vehicle getVariable QGVAR(menu)}) then {
            _vehicle setVariable [QGVAR(menu), true, true];
        };
    };
    
    _vehicle setVariable [QGVAR(id), [_vehicle] call FUNC(server,objectId), true];

    if (!isNil QMODULE(base_protection)) then {
        [_vehicle] __submodulePP(base_protection);
    };

    if (!isNil QMODULE(vehicle_abandon)) then {
        [_vehicle] __submodulePP(vehicle_abandon);
    };

    if (!isNil QMODULE(vehicle_loadout)) then {
        [_vehicle] __submodulePP(vehicle_loadout);
    };
    
    if (!isNil QMODULE(vehicle_mhq)) then {
        [_vehicle] __submodulePP(vehicle_mhq);
    };

    if (!isNil QMODULE(vehicle_respawn)) then {
        [_vehicle] __submoduleVM(vehicle_respawn);
    };
    
    if (!isNil QMODULE(vehicle_service)) then {
        [_vehicle] __submodulePP(vehicle_service);
    };
    
    if (!isNil QMODULE(vehicle_wreck)) then {
        if (isNil {_vehicle getVariable QGVAR(wreckable)}) then {
            _vehicle setVariable [QGVAR(wreckable), false, true];
        };
        
        [_vehicle] __submodulePP(vehicle_wreck);
    };
    
    if (_vehicle isKindOf "Air") then {
        _vehicle addEventHandler ["killed", {
            private ["_vehicle"];
            
            PARAMS_1(_vehicle);

            _vehicle spawn {
                sleep 1;

                [_this] call FUNC(THIS_MODULE,freeze);
            };
        }];
    };
};

if (hasInterface) then {
    waitUntil {!isNil {_vehicle getVariable QGVAR(id)}};

    if (!isNil QMODULE(halo)) then {
        [_vehicle] __submodulePP(halo);
    };
    
    if (!isNil QMODULE(perk)) then {
        [_vehicle] __submodulePP(perk);
    };
    
    if (!isNil QMODULE(option)) then {
        [_vehicle] __submodulePP(option);
    };

    if (!isNil QMODULE(vehicle_3d)) then {
        [_vehicle] __submodulePP(vehicle_3d);
    };
    
    if (!isNil QMODULE(vehicle_flip)) then {
        [_vehicle] __submodulePP(vehicle_flip);
    };
    
    if (!isNil QMODULE(vehicle_lift)) then {
        [_vehicle] __submodulePP(vehicle_lift);
    };
    
    if (!isNil QMODULE(vehicle_marker)) then {
        [_vehicle] __submodulePP(vehicle_marker);
    };
    
    if (!isNil QMODULE(vehicle_menu)) then {
        [_vehicle] __submodulePP(vehicle_menu);
    };
    
    if (!isNil QMODULE(vehicle_protection)) then {
        [_vehicle] __submodulePP(vehicle_protection);
    };

    if (!isNil QMODULE(vehicle_refuel)) then {
        [_vehicle] __submodulePP(vehicle_refuel);
    };
    
    if (!isNil QMODULE(vehicle_repair)) then {
        [_vehicle] __submodulePP(vehicle_repair);
    };
    
    if (!isNil QMODULE(vehicle_welcome)) then {
        [_vehicle] __submodulePP(vehicle_welcome);
    };
};

if (!isNil QMODULE(vehicle_bonus)) then {
    [_vehicle] __submoduleVM(vehicle_bonus);
};

if (!isNil QMODULE(vehicle_cargo)) then {
    [_vehicle] __submoduleVM(vehicle_cargo);
};

if (!isNil QMODULE(vehicle_deploy)) then {
    [_vehicle] __submodulePP(vehicle_deploy);
};

if (!isNil QMODULE(vehicle_pack)) then {
    [_vehicle] __submodulePP(vehicle_pack);
};

if (!isNil QMODULE(vehicle_ramp)) then {
    [_vehicle] __submodulePP(vehicle_ramp);
};

if (!isNil QMODULE(vehicle_tow)) then {
    [_vehicle] __submoduleVM(vehicle_tow);
};

_vehicle addEventHandler ["HandleDamage", {
    private ["_unit", "_part", "_damage", "_injurer", "_projectile"];

    PARAMS_5(_unit, _part, _damage, _injurer, _projectile);

    if ({isPlayer _x} count crew _unit > 0 && {isPlayer _injurer}) exitWith {0};
    if (_unit distance (getMarkerPos QGVAR(base_south)) < 500 && {{side _x in [east, civilian]} count crew _unit < 1}) exitWith {0};

    _damage
}];