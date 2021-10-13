/**
 * Mission Side Module
 *
 * Description: This module is responsible for handling side missions.
 */

#define THIS_MODULE mission_side
#include "x_macros.sqf"

// Set available side mission types along with chance it will occur.
GVAR(mission_side_type_missions) = [
    ["crash", 40]
];

// Set time threshold once triggered.
GVAR(mission_side_time_threshold) = [300, 600];

__cppfln(FUNC(THIS_MODULE,create),THIS_MODULE\functions\fn_create.sqf);
__cppfln(FUNC(THIS_MODULE,handle),THIS_MODULE\functions\fn_handle.sqf);

MODULE(THIS_MODULE) = true;