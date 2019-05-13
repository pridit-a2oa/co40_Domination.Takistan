/**
 * Original Author: -=XTRA=- tox1m
 *
 * Description:
 * Cleans up bombs from the given area.
 * Uses nearObjects, since nearestObjects doesnt seem to work with bombs
 */

#include "x_macros.sqf"
private ["_types", "_bombs"];

_types = [
    "HandGrenade_East",
    "HandGrenade_West",
    "Bo_GBU12_LGB",
    "HandGrenade",
    "Bo_FAB_250",
    "PipeBomb",
    "MineE",
    "Mine"
];

while {true} do {
    _bombs = [];
    
    {
        _bombs = _bombs + ((markerPos QGVAR(base_south)) nearObjects [_x, 500]);
    } forEach _types;

    if (count _bombs > 0) then {
        {
            deleteVehicle _x
        } forEach _bombs;
    };
    
    sleep 0.5; // Short sleep for catching all the bombs before damage occurs.
};