/**
 * Base Ammobox Module
 *
 * Description: This module handles spawning a static ammobox at a designated
 * location (placed within the editor).
 */

#define THIS_MODULE base_ammobox
#include "x_macros.sqf"

if (isNil QMODULE(ammobox)) exitWith {};

MODULE(THIS_MODULE) = true;