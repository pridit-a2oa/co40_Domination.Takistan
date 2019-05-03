/**
 * Ammobox Module
 *
 * Description: This module provides ammobox replenishing & spawning.
 */

#define THIS_MODULE ammobox
#include "x_macros.sqf"

// Set ammobox module
GVAR(ammobox_type) = "USVehicleBox_EP1";

__cppfln(FUNC(THIS_MODULE,create),THIS_MODULE\functions\fn_create.sqf);
__cppfln(FUNC(THIS_MODULE,replenish),THIS_MODULE\functions\fn_replenish.sqf);

MODULE(THIS_MODULE) = true;