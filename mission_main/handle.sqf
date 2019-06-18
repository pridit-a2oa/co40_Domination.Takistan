/**
 * Mission Main Module (Handler)
 */

#define THIS_MODULE mission_main
#include "x_macros.sqf"
private ["_locations", "_target"];

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
        sleep 20;
        
        _target = GVAR(mission_main_targets) call BIS_fnc_selectRandom;
        
        [_target] call FUNC(THIS_MODULE,reset);
        [_target] spawn FUNC(THIS_MODULE,create);
    };
};