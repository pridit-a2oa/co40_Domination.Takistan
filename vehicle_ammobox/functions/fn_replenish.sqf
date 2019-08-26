#include "x_macros.sqf"
private ["_box"];

PARAMS_1(_box);

clearMagazineCargoGlobal _box;
clearWeaponCargoGlobal _box;

{
    {
        _box addWeaponCargoGlobal [_x, 10];
    } forEach _x;
} forEach [
    GVAR(ammobox_type_rifles_assault),
    GVAR(ammobox_type_machine_guns),
    GVAR(ammobox_type_rifles_sniper),
    GVAR(ammobox_type_handguns),
    GVAR(ammobox_type_launchers),
    GVAR(ammobox_type_launchers_grenade),
    GVAR(ammobox_type_baf),
    GVAR(ammobox_type_pmc)
];

{
    _box addMagazineCargoGlobal [_x, 50];
} forEach GVAR(ammobox_type_ammo_gun);

{
    {
        _box addMagazineCargoGlobal [_x, 50];
    } forEach _x;
} forEach [
    GVAR(ammobox_type_ammo_launcher)
];

{
    {
        _box addMagazineCargoGlobal [_x, 20];
    } forEach _x;
} forEach [
    GVAR(ammobox_type_ammo_launcher_grenade),
    GVAR(ammobox_type_ammo_smoke),
    GVAR(ammobox_type_ammo_flare),
    GVAR(ammobox_type_misc)
];

{
    _box addWeaponCargoGlobal [_x, 5];
} forEach GVAR(ammobox_type_equipment);