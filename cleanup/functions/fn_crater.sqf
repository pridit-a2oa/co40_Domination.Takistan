/**
 * Original Author: -=XTRA=- tox1m
 * https://forums.bohemia.net/forums/topic/110199-crater-cleaner-and-a-bomb-remover-scripts
 */

#include "x_macros.sqf"
private ["_craters"];

while {true} do {
    _craters = nearestObjects [markerPos QGVAR(map_zone), ["CraterLong"], 9500];
    
    sleep 0.1;

    if (count _craters > 0) then {
        for "_i" from 0 to ((count _craters) - 1) do {
            deleteVehicle (_craters select _i);
        };
    };
    
    sleep 30;
};