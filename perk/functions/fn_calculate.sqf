#define THIS_MODULE perk
#include "x_macros.sqf"
private ["_respawned", "_score", "_points", "_available", "_ids", "_unlocked"];

PARAMS_1(_respawned);

if !(call FUNC(THIS_MODULE,override)) then {
    _score = score player;
    _points = ((floor(_score / GVAR(perk_amount_score)) * GVAR(perk_amount_points)) max 0) min 15;

    _available = player getVariable QGVAR(perk_points);
    _ids = player getVariable QGVAR(perk_ids);
    _unlocked = player getVariable QGVAR(perks_unlocked);

    for "_i" from 1 to 8 do {
        if (_score >= (_i * GVAR(perk_amount_score)) && {(count _unlocked + _available) < ((_i * GVAR(perk_amount_points)) min 15)}) then {
            if (!_respawned && {player distance GVAR(spawn) > 5}) then {
                [_points - (_available + count _unlocked)] call FUNC(THIS_MODULE,awarded);
            };
            
            player setVariable [QGVAR(perk_points), _points - count _unlocked];
        };
    };
};

if (_respawned) then {
    call FUNC(perk,reset);
};