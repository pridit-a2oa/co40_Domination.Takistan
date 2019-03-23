#define THIS_MODULE perk
#include "x_macros.sqf"
#define __ctrl(vctrl) _ctrl = _XD_display displayCtrl vctrl
#define __ctrl2(ectrl) (_XD_display displayCtrl ectrl)
private ["_tier", "_perk", "_id", "_points", "_unlocked"];
PARAMS_2(_tier,_perk);

disableSerialization;

_XD_display = uiNamespace getVariable "X_PERK_DIALOG";

_id = ((_tier * 10) + _perk);
_points = player getVariable QGVAR(perk_points_available);
_unlocked = player getVariable QGVAR(perks_unlocked);

// no perk points available to allocate
if (_points == 0) exitWith {};

// perk already unlocked
if (_unlocked find _id != -1) exitWith {};

// inacessible perk (role restriction)
if (ctrlText __ctrl2(200 + _id) == "\ca\ui\data\cmdbar_donotfire_ca") exitWith {};

[_tier,_perk] call FUNC(THIS_MODULE,unlock);

player setVariable [QGVAR(perk_points_available), _points - 1];
player setVariable [QGVAR(perks_unlocked), (_unlocked + [_id])];

if (count _unlocked == 14) then {
    playSound "PowerOfTheSun";
};

closeDialog 0;
call FUNC(THIS_MODULE,show);