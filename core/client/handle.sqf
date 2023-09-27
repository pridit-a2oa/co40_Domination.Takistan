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
        "damage",
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