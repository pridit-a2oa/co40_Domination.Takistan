#include "x_macros.sqf"

player playMove "AinvPknlMstpSlayWrflDnon_medic";

while {true} do {
    sleep 2;
    player say [QGVAR(sound_repair), 20];
};

waitUntil {animationState player != "AinvPknlMstpSlayWrflDnon_medic"};