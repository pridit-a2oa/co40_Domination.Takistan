#include "x_macros.sqf"
private ["_box"];

PARAMS_1(_box);

[nil, nil, rClearMagazineCargo, _box] call RE;
[nil, nil, rClearWeaponCargo, _box] call RE;

{
    {
        [nil, nil, rAddWeaponCargo, _box, _x, 10] call RE;
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
    [nil, nil, rAddMagazineCargo, _box, _x, 50] call RE;
} forEach GVAR(ammobox_type_ammo_gun);

{
    {
        [nil, nil, rAddMagazineCargo, _box, _x, 50] call RE;
    } forEach _x;
} forEach [
    GVAR(ammobox_type_ammo_launcher)
];

{
    {
        [nil, nil, rAddMagazineCargo, _box, _x, 20] call RE;
    } forEach _x;
} forEach [
    GVAR(ammobox_type_ammo_launcher_grenade),
    GVAR(ammobox_type_ammo_smoke),
    GVAR(ammobox_type_ammo_flare),
    GVAR(ammobox_type_misc)
];

{
    [nil, nil, rAddWeaponCargo, _box, _x, 5] call RE;
} forEach GVAR(ammobox_type_equipment);