/**
 * Core Module - Client (Handler)
 */

#define THIS_MODULE client
#include "x_macros.sqf"

0 spawn {
    sleep 0.01;

    uiNamespace setVariable [QGVAR(notice), displayNull];

    {
        player addWeapon _x;
    } forEach [
        format ["Binocular%1", if ((str player) in GVAR(marksman)) then {"_Vector"} else {""}],
        "ItemCompass",
        "ItemGPS",
        "ItemMap",
        "ItemRadio",
        "ItemWatch",
        "NVGoggles"
    ];

    player disableConversation true;
    
    if (sunOrMoon == 0) then {
        if (!isNil QMODULE(setting) && {(player getVariable QGVAR(nightvision)) select 1 == 0}) exitWith {};

        player action ["NVGoggles", player];
    };
    
    enableRadio true;
    enableSentences false;
    enableEngineArtillery ((str player) in GVAR(artillery));
    
    [100] call FUNC(THIS_MODULE,reveal);

    {
        _x setAmmoCargo 0;
    } forEach (allMissionObjects "US_WarfareBVehicleServicePoint_Base_EP1");

    {
        if !(_x isKindOf "Wreck") then {
            _x addEventHandler ["HandleDamage", {0}];
            _x enableSimulation false;
        };
    } forEach (allMissionObjects "Thing");

    [] exec "\ca\modules\Clouds\data\scripts\BIS_CloudSystem.sqs";
};

onEachFrame {call d_fnc_client_perFrame};

if (!isNil QMODULE(vehicle)) then {
    0 spawn {
        if !(isNil QMODULE(base_bonus)) then {
            waitUntil {
                sleep 0.1;
                
                [X_JIPH getVariable QGVAR(base_bonus), true] call BIS_fnc_areEqual
            };
        };
        
        ["init_vehicles", {
            ["init_vehicles"] call FUNC(THIS_MODULE,removePerFrame);

            {
                [_x] spawn FUNC(vehicle,handle);
            } forEach call FUNC(common,vehicles);
        }, 0] call FUNC(THIS_MODULE,addPerFrame);
    };
};

if (isMultiplayer) then {
    ["init_actions", {
        ["init_actions"] call FUNC(THIS_MODULE,removePerFrame);

        {
            private ["_unit"];

            _unit = _x;

            if !([_x, player] call BIS_fnc_areEqual) then {
                if !(isNil QMODULE(inventory)) then {
                    {
                        _unit addAction _x;
                    } forEach GVAR(inventory_type_actions);
                };
                
                if (!isNil QMODULE(revive)) then {
                    _x addAction GVAR(revive_player_action);
                    
                    _x addAction [
                        "Debug" call FUNC(common,GreyText),
                        FUNCTION(revive,debug),
                        [],
                        10,
                        false,
                        true,
                        "",
                        "_this != _target && {serverCommandAvailable '#logout'}"
                    ];
                };

                if (!isNil QMODULE(drag)) then {
                    _x addAction GVAR(drag_player_action);
                };
            };
        } forEach playableUnits;
    }, 0] call FUNC(THIS_MODULE,addPerFrame);
};

if (!isNil QMODULE(ammobox)) then {
    ["init_ammobox", {
        ["init_ammobox"] call FUNC(THIS_MODULE,removePerFrame);
        
        private ["_type"];
        
        _type = [faction player] call FUNC(ammobox,type);

        if (_type select 2) then {
            {
                [_x] call FUNC(ammobox,handle);
            } forEach (allMissionObjects (_type select 1));
        };
    }, 0] call FUNC(THIS_MODULE,addPerFrame);
};

["player", {
    private ["_rating"];
    
    _rating = rating player;

    if (_rating < 0) then {
        player addRating (abs (_rating));
    };
    
    if (!isNil QMODULE(perk)) then {
        [false] call FUNC(perk,calculate);
    };
}, 5] call FUNC(THIS_MODULE,addPerFrame);

player addEventHandler ["HandleDamage", {
    private ["_unit", "_part", "_damage", "_injurer", "_projectile"];

    PARAMS_5(_unit, _part, _damage, _injurer, _projectile);

    if !(alive _unit) exitWith {0};
    if (_unit getVariable QGVAR(unconscious)) exitWith {0};

    // don't damage units by vehicle proxy, unless vehicle sustained significant damage (avoid exploding vehicle not injuring occupants but occupants may die before the vehicle does)
    if ([_part, ""] call BIS_fnc_areEqual && {!([vehicle _unit, _unit] call BIS_fnc_areEqual)} && {damage (vehicle _unit) < 0.7}) exitWith {0};

    // don't damage if injurer is self, unless satcheled or impacting the ground via freefall
    if ([_unit, _injurer] call BIS_fnc_areEqual && {!([_projectile, "PipeBomb"] call BIS_fnc_areEqual)} && {!([animationState _injurer, "halofreefall"] call KRON_StrInStr)}) exitWith {0};

    // don't damage friendly units, unless self-inflicted or occupying the same vehicle
    if (!([_unit, _injurer] call BIS_fnc_areEqual) && {!([vehicle _unit, vehicle _injurer] call BIS_fnc_areEqual)} && {[side (group _injurer), side (group _unit)] call BIS_fnc_areEqual}) exitWith {0};

    if (!isNil QMODULE(revive)) then {
        _limbs = 1;
        _incurred = 0;
        _new_damage = 0;

        _damage = switch (true) do {
            case ([_unit, vehicle _unit] call BIS_fnc_areEqual && {_unit getVariable QGVAR(reduced_foot) && {_injurer isKindOf "CAManBase"}}): {_damage * 0.4};
            default {_damage * 0.8};
        };
        
        _config = configFile >> "cfgVehicles" >> (typeOf _unit);
        
        switch (_part) do {
            case "head_hit": {
                _armor = getNumber (_config >> "hitpoints" >> "HitHead" >> "armor");
                _incurred = (_damage * (0.6 + (1 - _armor))) min 0.89;
                _new_damage = ((_unit getVariable QGVAR(head_hit)) + _incurred) min 0.89;
                
                _unit setVariable [QGVAR(head_hit), _new_damage];
            };
            
            case "body": {
                _armor = getNumber (_config >> "hitpoints" >> "HitBody" >> "armor");
                _pass_through = getNumber (_config >> "hitpoints" >> "HitBody" >> "passThrough");
                
                _incurred = if (_pass_through < 1 && _armor == 1) then {
                    (_damage * 0.5) min 0.89
                } else {
                    (_damage * (0.6 + (1 - _armor))) min 0.89
                };
                
                _new_damage = ((_unit getVariable QGVAR(body)) + _incurred) min 0.89;

                _unit setVariable [QGVAR(body), _new_damage];
            };
            
            case "hands": {
                _limbs = 2;
                _incurred = _damage min 15;
                _new_damage = ((_unit getVariable QGVAR(hands)) + _incurred) min 15;
                
                _unit setVariable [QGVAR(hands), _new_damage];
            };
            
            case "legs": {
                _limbs = 2;
                _incurred = _damage min 15;
                _new_damage = ((_unit getVariable QGVAR(legs)) + _incurred) min 15;

                _unit setVariable [QGVAR(legs), _new_damage];
            };
            
            case "": {
                _incurred = _damage min 0.89;
                _new_damage = ((_unit getVariable QGVAR(overall)) + _incurred) min 0.89;

                _unit setVariable [QGVAR(overall), _new_damage];
            };
        };
        
        39671 cutRsc [GVAR(revive_type_blood) call BIS_fnc_selectRandom, "PLAIN"];
        
        _damage = _new_damage;
        
        if (_limbs != 0) then {
            if ((_limbs == 1 && {_damage >= 0.89}) || {(_limbs == 2 && {_damage >= 15})} || ((vehicle player) != player && {!alive (vehicle player)})) then {
                [_unit] call FUNC(revive,unconscious);
            };
        };
    };
    
    _damage
}];

player addEventHandler ["respawn", {
    private ["_unit", "_corpse", "_respawn"];
    
    PARAMS_2(_unit, _corpse);

    setPlayerRespawnTime 30;
    
    titleText ["", "BLACK FADED"];
    
    _unit spawn {
        _this allowDamage false;
        
        sleep GVAR(client_time_invulnerable);
        
        _this allowDamage true;
    };
    
    if (!isNil QMODULE(respawn)) then {
        [_unit, position _corpse] call FUNC(respawn,spawn);
    };
    
    if (!isNil QMODULE(setting)) then {
        _unit switchCamera ((_unit getVariable QGVAR(camera)) select 1);
    };

    if (!isNil QMODULE(revive)) then {
        [_unit] call FUNC(revive,reset);
    };
    
    {
        private ["_module", "_path"];

        _module = _x;
        _path = _module;

        if ([typeName _module, "ARRAY"] call BIS_fnc_areEqual) then {
            _module = _x select 0;
            _path = _x select 1;
        };

        if !(isNil (format [QMODULE(%1), _module])) then {
            __handlerPP(_path);
        };
    } forEach [
        "backpack",
        "base_rd",
        "communication",
        ["construction_farp", "construction\types\farp"],
        ["construction_fortification", "construction\types\fortification"],
        ["construction_mash", "construction\types\mash"],
        ["construction_nest", "construction\types\nest"],
        "drag",
        ["inventory_medical", "inventory\types\medical"],
        ["inventory_refuel", "inventory\types\refuel"],
        ["inventory_repair", "inventory\types\repair"],
        "medical",
        "perk",
        "option",
        "revive"
    ];
    
    if (!isNil QMODULE(perk)) then {
        [true] call FUNC(perk,calculate);
    };
    
    if (!isNil QMODULE(backpack) && {_unit getVariable QGVAR(backpack)} && {count GVAR(backpack) > 0}) then {
        call FUNC(backpack,action);
    };
    
    removeAllWeapons _unit;
    removeBackpack _unit;
    
    [_unit, _corpse] spawn {
        private ["_unit", "_corpse", "_backpack"];
        
        PARAMS_2(_unit, _corpse);
        
        _backpack = unitBackpack _corpse;
        
        if !(isNull _backpack) then {
            if (!isNil QMODULE(item) && {{(_x select 0) in ([1, GVAR(item_types)] call FUNC(common,arrayValues))} count (getWeaponCargo _backpack) > 0}) then {
                clearWeaponCargo _backpack;
            };

            _unit action ["AddBag", _corpse, typeOf _backpack];
            
            sleep 2;
            
            _unit switchMove "";
        };
        
        titleText ["", "BLACK IN", 2];
    };
    
    if (!isNil QMODULE(loadout) && {_unit getVariable QGVAR(loadout)} && {count GVAR(loadout) > 0}) then {
        call FUNC(loadout,restore);
    } else {
        private ["_magazines", "_weapons"];

        _magazines = if !(isNil QMODULE(gear)) then {
            [
                magazines _corpse,
                "magazine"
            ] call FUNC(gear,items)
        } else {
            magazines _corpse
        };

        {
            _unit addMagazine _x;
        } forEach _magazines;

        _weapons = if !(isNil QMODULE(gear)) then {
            [
                weapons _corpse,
                "weapon",
                "restored"
            ] call FUNC(gear,items)
        } else {
            weapons _corpse
        };

        {
            _unit addWeapon _x;
        } forEach _weapons;
        
        _unit selectWeapon (primaryWeapon _unit);
    };
    
    if (sunOrMoon == 0 && {(weapons _unit) find "NVGoggles" != -1}) then {
        if (!isNil QMODULE(setting) && {(player getVariable QGVAR(nightvision)) select 1 == 0}) exitWith {};

        _unit action ["NVGoggles", _unit];
    };
}];

player addEventHandler ["Killed", {
    private ["_unit"];
    
    PARAMS_1(_unit);

    [true, "switchMove", [_unit, ""]] call FUNC(network,mp);
    
    _unit spawn {
        waitUntil {sleep 1; !([_this, player] call BIS_fnc_areEqual)};
        
        hideBody _this;
    };
}];

deleteVehicle GVAR(client_init_trig);

GVAR(client_init_trig) = nil;