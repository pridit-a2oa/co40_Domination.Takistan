/**
 * Core Module - Server
 */

#define THIS_MODULE server
#include "x_macros.sqf"

__cppfln(FUNC(THIS_MODULE,empty),core\THIS_MODULE\functions\fn_empty.sqf);

__ccppfln(core\THIS_MODULE\modules.sqf);

if (isDedicated) then {
    if (!isNil QMODULE(vehicle)) then {
        {
            [_x] __module(vehicle);
        } forEach vehicles;
    };
};