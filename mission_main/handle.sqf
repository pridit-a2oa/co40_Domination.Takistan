/**
 * Mission Main Module (Handler)
 */

#define THIS_MODULE mission_main
#include "x_macros.sqf"
private ["_target", "_locations"];

if (hasInterface) then {
    _target = X_JIPH getVariable QGVAR(target);
    
    if (!isNil "_target") then {
        {
            _x addEventHandler ["HandleDamage", {0}];
            _x enableSimulation false;
        } forEach (nearestObjects [position _target, ["Thing", "Land_tent_east"], GVAR(mission_main_radius_zone)]);
        
        {
            [
                _x,
                "Capture" call FUNC(common,RedText),
                [1, GVAR(3d_distance_visible)],
                false,
                true
            ] spawn FUNC(3d,create);
        } forEach (_target getVariable QGVAR(camps));
        
        {
            [
                _x,
                "Destroy" call FUNC(common,RedText),
                [1, GVAR(3d_distance_visible)],
                true
            ] spawn FUNC(3d,create);
        } forEach (_target getVariable QGVAR(radios));
    };
};

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
    
    for "_i" from 1 to GVAR(mission_main_amount_targets) do {
        _target = GVAR(mission_main_targets) call BIS_fnc_selectRandom;
        
        [_target] spawn FUNC(THIS_MODULE,create);
    };
};