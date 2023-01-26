/**
 * Admin Captive Module
 *
 * Description: This module facilitates toggling of a captive state.
 */

#define THIS_MODULE admin_captive
#include "x_macros.sqf"

__cppfln(FUNC(THIS_MODULE,populate),THIS_MODULE\functions\fn_populate.sqf);

MODULE(THIS_MODULE) = true;