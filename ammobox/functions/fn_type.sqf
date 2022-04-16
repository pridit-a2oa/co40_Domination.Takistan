#include "x_macros.sqf"
private ["_faction", "_factions", "_ammobox"];

PARAMS_1(_faction);

_factions = [0, GVAR(ammobox_types)] call FUNC(common,arrayValues);

{
    if (_faction in _x || {count _x < 1}) exitWith {
        _ammobox = GVAR(ammobox_types) select _forEachIndex;
    };
} forEach _factions;

_ammobox