/**
 * Setting Module - Tutorial Submodule
 */

#define THIS_MODULE setting
#include "x_macros.sqf"

player setVariable [QGVAR(tutorial), [1, 0]];

if (!isNil QMODULE(profile)) then {
    [__profile("tutorial"), 0] call FUNC(profile,set);
};