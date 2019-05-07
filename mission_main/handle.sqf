/**
 * Mission Main Module (Handler)
 */

#define THIS_MODULE mission_main
#include "x_macros.sqf"

if (isServer) then {
    GVAR(mission_main_targets) = nearestLocations [markerPos QGVAR(map_zone), ["NameCityCapital", "NameCity", "NameVillage"], 7500];
    
    _targets = [];
    
    {
        _base = _x distance (markerPos QGVAR(base_south)) > GVAR(mission_main_distance_base);
        _naf = _x distance (markerPos QGVAR(base_north)) > GVAR(mission_main_distance_naf);
        
        if (_base && {_naf}) then {
            _targets = _targets + [_x];
        };
    } forEach GVAR(mission_main_targets);
};