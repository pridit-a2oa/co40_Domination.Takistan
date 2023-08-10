/**
 * Revive Module
 *
 * Description: This module enables players to revive eachother, should they
 * be mortally wounded.
 */

#define THIS_MODULE revive
#include "x_macros.sqf"

if (!isMultiplayer) exitWith {};

// Blood effects
GVAR(revive_type_blood) = [
    QGVAR(revive_blood_1),
    QGVAR(revive_blood_2)
];

// Amount of damage a revived player will have (medics revive full health)
GVAR(revive_amount_damage) = 0.4;

// AddAction parameters that need to apply to existing clients & JIP
GVAR(revive_player_action) = [
    "Revive" call FUNC(common,RedText),
    FUNCTION(THIS_MODULE,revive),
    [],
    9,
    false,
    true,
    "",
    "alive _target && {_this != _target} && {_this == vehicle _this} && {_this distance _target < 4} && {_target getVariable 'd_unconscious'} && {!(_target getVariable 'd_reviving')} && {!(_target getVariable 'd_dragging')}"
];

// Maximum distance to a capable player before an incapacitated player will call for help
GVAR(revive_distance_exclaim) = 400;

// Amount of time before respawning a player that is unconscious
GVAR(revive_time_respawn) = 240;

if (hasInterface) then {
    player setVariable [QGVAR(head_hit), 0];
    player setVariable [QGVAR(body), 0];
    player setVariable [QGVAR(hands), 0];
    player setVariable [QGVAR(legs), 0];
    player setVariable [QGVAR(overall), 0];
    
    player setVariable [QGVAR(unconscious), false, true];
    player setVariable [QGVAR(reviving), false, true];
    
    player setVariable [QGVAR(reduced_foot), false];
};

__cppfln(FUNC(THIS_MODULE,countdown),THIS_MODULE\functions\fn_countdown.sqf);
__cppfln(FUNC(THIS_MODULE,debug),THIS_MODULE\functions\fn_debug.sqf);
__cppfln(FUNC(THIS_MODULE,reset),THIS_MODULE\functions\fn_reset.sqf);
__cppfln(FUNC(THIS_MODULE,revive),THIS_MODULE\functions\fn_revive.sqf);
__cppfln(FUNC(THIS_MODULE,unconscious),THIS_MODULE\functions\fn_unconscious.sqf);
__cppfln(FUNC(THIS_MODULE,valid),THIS_MODULE\functions\fn_valid.sqf);

MODULE(THIS_MODULE) = true;