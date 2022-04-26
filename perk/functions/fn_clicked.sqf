#define THIS_MODULE perk
#include "x_macros.sqf"
private ["_tier", "_perk", "_id", "_points", "_unlocked"];

PARAMS_2(_tier, _perk);

disableSerialization;

_id = ((_tier * 10) + _perk);

_points = player getVariable QGVAR(perk_points);
_ids = player getVariable QGVAR(perk_ids);
_unlocked = player getVariable QGVAR(perks_unlocked);

// no perk points available to allocate
if (_points == 0 && {!isNil QMODULE(admin) && {!(__submodulePP(admin))}}) exitWith {};

// perk already unlocked
if (_ids find _id != -1) exitWith {};

// inacessible perk (role restriction)
if (ctrlText (DIALOG("X_PERK_DIALOG", 200 + _id)) == "\ca\ui\data\cmdbar_donotfire_ca") exitWith {};

[_tier, _perk] call FUNC(THIS_MODULE,unlock);

if (_points > 0) then {
    player setVariable [QGVAR(perk_points), _points - 1];
};

player setVariable [QGVAR(perk_ids), (_ids + [_id])];
player setVariable [QGVAR(perks_unlocked), (_unlocked + [[_tier, _perk]])];

closeDialog 0;

call FUNC(THIS_MODULE,show);