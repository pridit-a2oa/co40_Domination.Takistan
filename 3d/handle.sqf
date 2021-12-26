/**
 * 3D Module (Handler)
 */

#define THIS_MODULE 3d
#include "x_macros.sqf"

if (hasInterface) then {
	if (!isNil QMODULE(base_rd)) then {
		__submodulePP(base_rd);
	};
};