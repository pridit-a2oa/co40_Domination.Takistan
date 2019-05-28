/**
 * 3D Module - Ammobox Submodule
 */

#define THIS_MODULE 3d
#include "x_macros.sqf"

[position GVAR(ammoload), format ["%1<br /><t size='0.6'>Use the vehicle menu to load a box</t>", "Ammobox Load Point" call FUNC(common,YellowText)]] call FUNC(THIS_MODULE,create);