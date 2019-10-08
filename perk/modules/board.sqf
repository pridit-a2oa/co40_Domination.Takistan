/**
 * Perk Module - Board Submodule
 */

#include "x_macros.sqf"

"Perks" hintC [
    format ["You are given 1 perk point to allocate as you see fit straight away. Further perk points are given every %1 score.", GVAR(perk_amount_score)],
    "You are only able to unlock the bottom perks (role based) for the role you are currently playing. This is indicated by a white arrow above the column.",
    "Role based perks must be unlocked in sequence, starting with the first one at the top and then continuing down.",
    "Unlocked perks do not persist between switching roles. On reconnect you will receive points to re-allocate dependant on your score.",
    "Score, and by extension any unlocked perks and unused points, are reset every server restart."
];