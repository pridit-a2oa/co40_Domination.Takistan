#include "x_macros.sqf"

removeAllItems player;
removeAllWeapons player;
removeBackpack player;

{
    player addMagazine _x;
} forEach (GVAR(loadout) select 1);

{
    player addWeapon _x;
} forEach (GVAR(loadout) select 0);

player addBackpack (GVAR(loadout) select 2);

clearMagazineCargo (unitBackpack player);