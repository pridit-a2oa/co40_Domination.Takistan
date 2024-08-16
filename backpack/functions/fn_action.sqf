#include "x_macros.sqf"

if ([count GVAR(backpack), 0] call BIS_fnc_areEqual) exitWith {};

player setVariable [
    QGVAR(backpack_action),
    player addAction [
        (format [
            "Equip %1",
            getText (configFile >> "CfgWeapons" >> GVAR(backpack) select 0 >> "displayName")
        ]) call FUNC(common,GreyText),
        FUNCTION(backpack,equip),
        [],
        -7,
        false,
        true,
        "",
        "[player, _target] call BIS_fnc_areEqual && {[player, vehicle player] call BIS_fnc_areEqual && {(position player) select 2 < 1 && {player getVariable 'd_backpack' && {count d_backpack > 0 && {[(d_backpack_animations find (animationState player)), -1] call BIS_fnc_areEqual}}}}}"
    ]
];