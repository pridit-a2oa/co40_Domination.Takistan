#include "x_macros.sqf"

removeAllItems player;
removeAllWeapons player;

{
    player addWeapon _x;
} forEach (GVAR(loadout) select 0);

{
    player addMagazine _x;
} forEach (GVAR(loadout) select 1);

player addBackpack (GVAR(loadout) select 2);
clearMagazineCargo (unitBackpack player);