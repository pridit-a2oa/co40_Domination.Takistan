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
    0 spawn {
        if (!isNil QMODULE(vehicle_bonus)) then {
            waitUntil {X_JIPH getVariable QGVAR(vehicle_bonus) == GVAR(vehicle_bonus_amount_max)};
        };
        
        ["init_vehicles", {
            {
                [_x] __handler("vehicle");
            } forEach vehicles;

            ["init_vehicles"] call FUNC(THIS_MODULE,removePerFrame)
        }, 0] call FUNC(THIS_MODULE,addPerFrame);
    };
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

["init_objects", {
    if (!isNil QMODULE(construction)) then {
        {
            _name = _x select 0;
            _type = _x select 1;
            
            {
                [_name, _x] call FUNC(construction,action);
                
                _x addEventHandler ["HandleDamage", {0}];
            } forEach (allMissionObjects _type);
        } forEach GVAR(construction_type_objects);
    };
    
    if (!isNil QMODULE(vehicle_mhq)) then {
        {
            _x addEventHandler ["HandleDamage", {0}];
        } forEach (allMissionObjects GVAR(vehicle_mhq_type_net));
    };

    ["init_objects"] call FUNC(THIS_MODULE,removePerFrame)
}, 0] call FUNC(THIS_MODULE,addPerFrame);

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
    
    if (!alive _unit) exitWith {0};
    if (lifeState _unit == "UNCONSCIOUS") exitWith {0};
    if ((vehicle _unit) != (vehicle _injurer) && {!local _injurer} && {side (group _injurer) == side (group _unit)}) exitWith {0};
    
    if (!isNil QMODULE(revive)) then {
        _incurred = 0;
        _new_damage = 0;
        _limbs = 1;
        
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
        
        if (_limbs != 0 && {!(_unit getVariable QGVAR(unconscious))}) then {
            if ((_limbs == 1 && {_damage >= 0.89}) || {(_limbs == 2 && {_damage >= 15})}) then {
                [_unit] call FUNC(revive,unconscious);
            };
        };
    };
    
    _damage
}];

player addEventHandler ["respawn", {
    private ["_unit", "_corpse", "_respawn", "_handlers"];
    
    PARAMS_2(_unit, _corpse);
    
    if (!isNil QMODULE(respawn)) then {
        [_unit, position _corpse] call FUNC(respawn,spawn);
    };
    
    _handlers = [
        "backpack",
        "medical",
        "perk",
        "option",
        "revive",
        "vehicle_repair"
    ];

    {
        if (!isNil (format [QMODULE(%1), _x])) then {
            __handler(_x);
        };
    } forEach _handlers;
    
    if (!isNil QMODULE(revive)) then {
        [_unit] call FUNC(revive,reset);
    };
    
    if (!isNil QMODULE(perk)) then {
        [true] call FUNC(perk,calculate);
    };
    
    if (!isNil QMODULE(backpack) && {player getVariable QGVAR(backpack)} && {count GVAR(backpack) > 0}) then {
        call FUNC(backpack,action);
    };
    
    if (!isNil QMODULE(loadout) && {player getVariable QGVAR(loadout)} && {count GVAR(loadout) > 0}) exitWith {
        call FUNC(loadout,restore);
    };
    
    removeAllWeapons player;
}];

player addEventHandler ["killed", {
    private ["_unit"];
    
    PARAMS_1(_unit);
    
    _unit spawn {
        sleep 30;
        
        hideBody _this;
    };
}];

deleteVehicle GVAR(client_init_trig);
GVAR(client_init_trig) = nil;