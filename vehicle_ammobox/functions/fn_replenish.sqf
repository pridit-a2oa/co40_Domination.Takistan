#include "x_macros.sqf"
private ["_box"];

PARAMS_1(_box);

[nil, nil, "per", rClearMagazineCargo, _box] call RE;
[nil, nil, "per", rClearWeaponCargo, _box] call RE;

{
    {
        [nil, nil, "per", rAddWeaponCargo, _box, _x, 10] call RE;
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
    [nil, nil, "per", rAddMagazineCargo, _box, _x, 100] call RE;
} forEach GVAR(ammobox_type_ammo_gun);

{
    {
        [nil, nil, "per", rAddMagazineCargo, _box, _x, 50] call RE;
    } forEach _x;
} forEach [
    GVAR(ammobox_type_ammo_launcher),
    GVAR(ammobox_type_ammo_launcher_grenade)
];

{
    {
        [nil, nil, "per", rAddMagazineCargo, _box, _x, 20] call RE;
    } forEach _x;
} forEach [
    GVAR(ammobox_type_ammo_smoke),
    GVAR(ammobox_type_ammo_flare),
    GVAR(ammobox_type_misc)
];

{
    [nil, nil, "per", rAddWeaponCargo, _box, _x, 5] call RE;
} forEach GVAR(ammobox_type_equipment);