/**
 * Drag Module
 *
 * Description: This module enables a player to drag an unconscious player.
 */

#define THIS_MODULE drag
#include "x_macros.sqf"

// Set addAction parameters that need to apply to existing clients & JIP
GVAR(drag_player_action) = [
    "Drag (Experimental)" call FUNC(common,RedText),
    FUNCTION(THIS_MODULE,drag),
    [],
    8,
    false,
    true,
    "",
    "alive _target && {_this != _target} && {_this == vehicle _this} && {_target getVariable 'd_unconscious'} && {!(_target getVariable 'd_reviving')} && {!(_target getVariable 'd_dragging')}"
];

if (hasInterface) then {
    player setVariable [QGVAR(dragging), false, true];
};

__cppfln(FUNC(THIS_MODULE,drag),THIS_MODULE\functions\fn_drag.sqf);
__cppfln(FUNC(THIS_MODULE,drop),THIS_MODULE\functions\fn_drop.sqf);

MODULE(THIS_MODULE) = true;