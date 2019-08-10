#define THIS_MODULE perk
#include "x_macros.sqf"
private ["_respawned", "_score", "_points"];

PARAMS_1(_respawned);

_score = score player;
_points = ((floor(_score / GVAR(perk_amount_score)) * GVAR(perk_amount_points)) max 0) min 14;

_available = player getVariable QGVAR(perk_points);
_ids = player getVariable QGVAR(perk_ids);
_unlocked = player getVariable QGVAR(perks_unlocked);

for "_i" from 1 to 7 do {
    if (_score >= (_i * GVAR(perk_amount_score)) && {(count _unlocked + _available) < (_i * GVAR(perk_amount_points))}) then {
        if (!_respawned && {player distance GVAR(flag) > 100}) then {
            [_points - (_available + count _unlocked)] call FUNC(THIS_MODULE,awarded);
        };
        
        player setVariable [QGVAR(perk_points), _points - count _unlocked];
    };
};

if (_respawned) then {    
    call FUNC(perk,reset);
};