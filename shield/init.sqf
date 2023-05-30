/**
 * Shield Module
 *
 * Description: This module creates a zoned area in which projectiles cannot
 * penetrate.
 */

#define THIS_MODULE shield
#include "x_macros.sqf"

// Object which prevents projectile penetration
GVAR(shield_type) = "ProtectionZone_EP1";

MODULE(THIS_MODULE) = true;