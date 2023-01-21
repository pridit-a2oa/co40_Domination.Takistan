/**
 * Mission Mini - Encampment Module
 *
 * Description: This module is responsible for handling the mini mission to
 * clear an enemy encampment.
 */

#define THIS_MODULE mission_mini_encampment
#include "x_macros.sqf"

// Add to the list of possible types of mini messions
GVAR(mission_mini_types) = GVAR(mission_mini_types) + [
    ["encampment", "Enemy Encampment"]
];

// The object composition to use to generate the camp
GVAR(mission_mini_encampment_type) = "Camp1_TK_EP1";

MODULE(THIS_MODULE) = true;