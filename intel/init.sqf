/**
 * Intel Module
 *
 * Description: This module rewards players for returning an item.
 */

#define THIS_MODULE intel
#include "x_macros.sqf"

// The intel item that can be acquired
GVAR(intel_type_item) = "EvMap";

// Score to reward when delivered
GVAR(intel_amount_score) = 10;

__cppfln(FUNC(THIS_MODULE,reward),THIS_MODULE\functions\fn_reward.sqf);

MODULE(THIS_MODULE) = true;