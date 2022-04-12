/**
 * Mission Main Module (Handler)
 */

#define THIS_MODULE mission_main
#include "x_macros.sqf"
private ["_target", "_locations"];

if (isServer) then {
    GVAR(mission_main_targets) = [];
    
    _locations = [["NameCityCapital", "NameCity", "NameVillage"], [markerPos QGVAR(map_zone), 7500]] call BIS_fnc_locations;
    
    {
        _base = _x distance (markerPos QGVAR(base_south)) > GVAR(mission_main_distance_base);
        _naf = _x distance (markerPos QGVAR(base_north)) > GVAR(mission_main_distance_naf);
        
        if (_base && {_naf}) then {
            GVAR(mission_main_targets) = GVAR(mission_main_targets) + [_x];
        };
    } forEach _locations;
    
    0 spawn {
        for "_i" from 1 to GVAR(mission_main_amount_targets) do {
            sleep GVAR(mission_main_time_delay);
            
            _target = GVAR(mission_main_targets) call BIS_fnc_selectRandom;
            
            [_target] spawn FUNC(THIS_MODULE,create);
        };
    };
};

if (hasInterface) then {
    _target = X_JIPH getVariable QGVAR(target);
    
    if (!isNil "_target") then {
        {
            _x addEventHandler ["HandleDamage", {0}];
            _x enableSimulation false;
        } forEach (nearestObjects [position _target, ["Land_tent_east"], GVAR(mission_main_radius_zone)]);
        
        {
            [
                _x,
                "Capture" call FUNC(common,RedText),
                [1, GVAR(3d_distance_visible)],
                false,
                true
            ] spawn FUNC(3d,create);
        } forEach (_target getVariable QGVAR(camps));
    };
    
    0 spawn {
        {
            {
                {
                    _x addEventHandler ["HandleDamage", {
                        if ((_this select 4) in GVAR(mission_main_type_projectiles)) exitWith {0};
                        if ((_this select 3) isKindOf "Air" && {!([_this select 4, "Bo_"] call KRON_StrInStr)} && {(_this select 3) distance (_this select 0) > 300}) exitWith {0};

                        _this select 2
                    }];
                } forEach (allMissionObjects _x);

                sleep 0.5;
            } forEach _x;
        } forEach [
            [GVAR(mission_main_type_radio)],
            [1, [1, GVAR(mission_main_type_optional)] call FUNC(common,arrayValues)] call FUNC(common,arrayValues)
        ];
    };
};