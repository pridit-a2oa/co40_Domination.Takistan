/**
 * Diary Module
 *
 * Description: This module populates information within the diary.
 */

#define THIS_MODULE diary
#include "x_macros.sqf"

__cppfln(FUNC(THIS_MODULE,create),THIS_MODULE\functions\fn_create.sqf);
__cppfln(FUNC(THIS_MODULE,format),THIS_MODULE\functions\fn_format.sqf);

MODULE(THIS_MODULE) = true;