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
        player setVariable [QGVAR(perk_points), _points - count _unlocked];
        
        if (!_respawned && {player distance GVAR(flag) > 100}) then {
            call FUNC(THIS_MODULE,awarded);
        };
    };
};

if (_respawned) then {
    if (_points < (count _unlocked + _available)) then {
        if (_points < count _unlocked) then {
            systemChat format [
                "You have lost %1 perk(s) due to being below the required score",
                count _unlocked - _points
            ];
            
            _ids resize _points;
            _unlocked resize _points;
        };
        
        player setVariable [QGVAR(perk_points), (_points - count _unlocked)];
    };
    
    call FUNC(perk,reset);
};