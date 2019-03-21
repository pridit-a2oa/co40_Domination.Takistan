#define THIS_MODULE perk
#include "x_macros.sqf"
private ["_id","_unlocked"];
PARAMS_1(_id);

scopeName "main";

_points = player getVariable QGVAR(perk_points_available);

// no perk points available to allocate
if (_points == 0) exitWith {};

_unlocked = player getVariable QGVAR(perks_unlocked);

// perk already unlocked
{
    if (_x == _id) then {
        breakOut "main";
    };
} forEach _unlocked;

[_id] call FUNC(THIS_MODULE,unlock);

player setVariable [QGVAR(perk_points_available), _points - 1];
player setVariable [QGVAR(perks_unlocked), (player getVariable QGVAR(perks_unlocked)) + [_id]];

if (count (player getVariable QGVAR(perks_unlocked)) == 9) then {
    playSound "PowerOfTheSun";
};

closeDialog 0;
call FUNC(THIS_MODULE,show);