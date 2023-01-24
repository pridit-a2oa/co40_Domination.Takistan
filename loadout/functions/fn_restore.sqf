#include "x_macros.sqf"

{
    player addMagazine _x;
} forEach (GVAR(loadout) select 1);

{
    if !([_x, "EvMap"] call BIS_fnc_areEqual) then {
        player addWeapon _x;
    };
} forEach (GVAR(loadout) select 0);

player selectWeapon (primaryWeapon player);

if (isNull (unitBackpack player)) then {
    player addBackpack (GVAR(loadout) select 2);
};