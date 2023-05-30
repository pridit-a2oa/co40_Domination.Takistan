/**
 * Reward Module
 *
 * Description: This module facilitates informing players of rewards
 * provided via other modules (perks, r&d).
 */

#define THIS_MODULE reward
#include "x_macros.sqf"

__cppfln(FUNC(THIS_MODULE,alert),THIS_MODULE\functions\fn_alert.sqf);
__cppfln(FUNC(THIS_MODULE,score),THIS_MODULE\functions\fn_score.sqf);

MODULE(THIS_MODULE) = true;