#define THIS_MODULE vehicle
#include "x_macros.sqf"
private ["_vehicle"];

PARAMS_1(_vehicle);

if !(isNil {_vehicle getVariable QGVAR(handled)}) exitWith {};

_vehicle setVariable [QGVAR(handled), true];

if (isNil {_vehicle getVariable QGVAR(position)}) then {
    _vehicle setVariable [QGVAR(position), position _vehicle, true];
    _vehicle setVariable [QGVAR(direction), getDir _vehicle, true];
};

if (isServer) then {
    private ["_expression"];

    _vehicle setVariable [QGVAR(killed), false];

    clearMagazineCargoGlobal _vehicle;
    clearWeaponCargoGlobal _vehicle;

    if (sunOrMoon == 0 && {simulationEnabled _vehicle} && {true in [_vehicle isKindOf "Air", _vehicle isKindOf "ATV_Base_EP1", _vehicle isKindOf "TT650_Base"]}) then {
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

    if (!isNil QMODULE(base_uav)) then {
        [_vehicle] __submodulePP(base_uav);
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

    if (!isNil QMODULE(vehicle_uav)) then {
        [_vehicle] __submodulePP(vehicle_uav);
    };
    
    if (!isNil QMODULE(vehicle_wreck)) then {
        if (isNil {_vehicle getVariable QGVAR(wreckable)}) then {
            _vehicle setVariable [QGVAR(wreckable), false, true];
        };
        
        [_vehicle] __submodulePP(vehicle_wreck);
    };
    
    if (_vehicle isKindOf "Air") then {
        _vehicle addEventHandler ["Killed", {
            private ["_vehicle"];
            
            PARAMS_1(_vehicle);

            _vehicle spawn {
                sleep 1;

                [_this] call FUNC(THIS_MODULE,freeze);
            };
        }];
    };

    _expression = {
        private ["_unit", "_killer"];

        PARAMS_2(_unit, _killer);

        if !(isServer) exitWith {};
        if (_unit getVariable QGVAR(killed)) exitWith {};
        if (count crew _unit > 0 && {{!isPlayer _x} count crew _unit > 0}) exitWith {};

        _unit setVariable [QGVAR(killed), true];

        __log format [
            "Destroyed %1 {""killer"":""%2"",""occupants"":""%3""}",
            [typeOf _unit] call FUNC(THIS_MODULE,name),
            if (isPlayer _killer) then {name _killer} else {side _killer},
            [_unit] call FUNC(THIS_MODULE,crew)
        ]];
    };

    _vehicle addEventHandler ["Killed", _expression];
    _vehicle addMPEventHandler ["MPKilled", _expression];
};

if (hasInterface) then {
    waitUntil {
        sleep 0.1;
        
        !isNil {_vehicle getVariable QGVAR(id)}
    };

    if (!isNil QMODULE(base_protection)) then {
        [_vehicle] __submodulePP(base_protection);
    };
    
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
    
    if (!isNil QMODULE(vehicle_repair)) then {
        [_vehicle] __submodulePP(vehicle_repair);
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

if (!isNil QMODULE(vehicle_texture)) then {
    [_vehicle] __submoduleVM(vehicle_texture);
};

if (!isNil QMODULE(vehicle_tow)) then {
    [_vehicle] __submoduleVM(vehicle_tow);
};

if (_vehicle isKindOf "Air") then {
    _vehicle addEventHandler ["getout", {
        private ["_vehicle", "_position", "_unit"];

        PARAMS_3(_vehicle, _position, _unit);

        if (!([_position, "driver"] call BIS_fnc_areEqual) || {!([_unit, player] call BIS_fnc_areEqual)}) exitWith {};

        gameLogic action ["autoHoverCancel", _vehicle];
    }];
};

_vehicle addEventHandler ["HandleDamage", {
    private ["_unit", "_part", "_damage", "_injurer", "_projectile"];

    PARAMS_5(_unit, _part, _damage, _injurer, _projectile);

    if ({isPlayer _x} count crew _unit > 0 && {isPlayer _injurer}) exitWith {0};
    if (_unit distance (getMarkerPos QGVAR(base_south)) < 500 && {{side _x in [east, civilian]} count crew _unit < 1}) exitWith {0};

    if ([_projectile, "M_Igla_AA"] call BIS_fnc_areEqual) then {_damage = _damage * 2};
    if ({isPlayer _x && {[_x, driver _unit] call BIS_fnc_areEqual && {_x getVariable QGVAR(reduced)}}} count crew _unit > 0) then {_damage = _damage * 0.70};

    _damage
}];