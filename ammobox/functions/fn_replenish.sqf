#include "x_macros.sqf"
private ["_ammobox", "_local"];

PARAMS_2(_ammobox, _local);

if (isNil "_ammobox" || {isNull _ammobox}) exitWith {};

if (_local) then {
    clearMagazineCargo _ammobox;
    clearWeaponCargo _ammobox;
} else {
    clearMagazineCargoGlobal _ammobox;
    clearWeaponCargoGlobal _ammobox;
};

{
    {
        if (_local) then {
            _ammobox addWeaponCargo [_x, 10];
        } else {
            _ammobox addWeaponCargoGlobal [_x, 10];
        };
    } forEach _x;
} forEach [
    GVAR(ammobox_type_rifles_assault),
    GVAR(ammobox_type_machine_guns),
    GVAR(ammobox_type_rifles_sniper),
    GVAR(ammobox_type_shotguns),
    GVAR(ammobox_type_handguns),
    GVAR(ammobox_type_launchers),
    GVAR(ammobox_type_launchers_grenade),
    GVAR(ammobox_type_baf),
    GVAR(ammobox_type_pmc)
];

{
    if (_local) then {
        _ammobox addMagazineCargo [_x, 50];
    } else {
        _ammobox addMagazineCargoGlobal [_x, 50];
    };
} forEach GVAR(ammobox_type_ammo_gun);

{
    {
        if (_local) then {
            _ammobox addMagazineCargo [_x, 50];
        } else {
            _ammobox addMagazineCargoGlobal [_x, 50];
        };
    } forEach _x;
} forEach [
    GVAR(ammobox_type_ammo_launcher)
];

{
    {
        if (_local) then {
            _ammobox addMagazineCargo [_x, 20];
        } else {
            _ammobox addMagazineCargoGlobal [_x, 20];
        };
    } forEach _x;
} forEach [
    GVAR(ammobox_type_ammo_launcher_grenade),
    GVAR(ammobox_type_ammo_smoke),
    GVAR(ammobox_type_ammo_flare),
    GVAR(ammobox_type_misc)
];

{
    if (_local) then {
        _ammobox addWeaponCargo [_x, 5];
    } else {
        _ammobox addWeaponCargoGlobal [_x, 5];
    };
} forEach GVAR(ammobox_type_equipment);