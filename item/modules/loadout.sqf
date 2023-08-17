/**
 * Item Module - Loadout Submodule
 */

#include "x_macros.sqf"
private ["_weapons", "_exclusions"];

PARAMS_1(_weapons);

_exclusions = [];

{
    if (_x in ([1, GVAR(item_types)] call FUNC(common,arrayValues))) then {
        _weapons = [_weapons, _weapons find _x] call FUNC(common,deleteAt);

        [_exclusions, _x] call BIS_fnc_arrayPush;
    };
} forEach _weapons;

if !([_exclusions, []] call BIS_fnc_areEqual) then {
    systemChat format ["Found item not saved: %1", str _exclusions];
};

_weapons