/**
 * Shield Module
 *
 * Description: This module creates a zoned area in which projectiles cannot
 * penetrate.
 */

#define THIS_MODULE shield
#include "x_macros.sqf"

// Set object which prevents projectile penetration.
GVAR(shield_type) = "ProtectionZone_EP1";

__cppfln(FUNC(THIS_MODULE,create),THIS_MODULE\functions\fn_create.sqf);

MODULE(THIS_MODULE) = true;