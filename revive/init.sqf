/**
 * Revive Module
 *
 * Description: This module enables players to revive eachother, should they
 * be mortally wounded.
 */

#define THIS_MODULE revive
#include "x_macros.sqf"

if (!isMultiplayer) exitWith {};

// Set blood effects
GVAR(revive_type_blood) = [
    QGVAR(revive_blood_1),
    QGVAR(revive_blood_2)
];

// Set amount of damage a revived player will have
GVAR(revive_amount_damage) = 0.4;

// Set addAction parameters that need to apply to existing clients & JIP
GVAR(revive_player_action) = [
    "Revive" call FUNC(common,RedText),
    FUNCTION(THIS_MODULE,revive),
    [],
    9,
    false,
    true,
    "",
    "_this != _target && {_this == vehicle _this} && {lifeState _target == 'UNCONSCIOUS'} && {!(_target getVariable 'd_reviving')} && {!(_target getVariable 'd_dragging')}"
];

// Set amount of time before respawning a player that is unconscious.
GVAR(revive_time_respawn) = 180;

if (hasInterface) then {
    player setVariable [QGVAR(head_hit), 0];
    player setVariable [QGVAR(body), 0];
    player setVariable [QGVAR(hands), 0];
    player setVariable [QGVAR(legs), 0];
    player setVariable [QGVAR(overall), 0];
    
    player setVariable [QGVAR(unconscious), false, true];
    player setVariable [QGVAR(reviving), false, true];
    
    player setVariable [QGVAR(revive_damage), GVAR(revive_amount_damage)];
};

__cppfln(FUNC(THIS_MODULE,countdown),THIS_MODULE\functions\fn_countdown.sqf);
__cppfln(FUNC(THIS_MODULE,reset),THIS_MODULE\functions\fn_reset.sqf);
__cppfln(FUNC(THIS_MODULE,revive),THIS_MODULE\functions\fn_revive.sqf);
__cppfln(FUNC(THIS_MODULE,unconscious),THIS_MODULE\functions\fn_unconscious.sqf);

MODULE(THIS_MODULE) = true;