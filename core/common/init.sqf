/**
 * Core Module - Common (client & server)
 */

#define THIS_MODULE common
#include "x_macros.sqf"

X_INIT = false;

#define __waitpl 0 spawn {scriptName "spawn_WaitForNotIsNullPlayer";waitUntil {!isNull player};X_INIT = true}
if (isServer) then {
    if (!isDedicated) then {
        __waitpl;
    } else {
        X_INIT = true;
    };
} else {
    if (isNull player) then {
        __waitpl;
    } else {
        X_INIT = true;
    };
};

__ccppfln(core\THIS_MODULE\scripts\common.sqf);
__ccppfln(core\THIS_MODULE\scripts\KRON_Strings.sqf);

__cppfln(FUNC(THIS_MODULE,arrayValues),core\THIS_MODULE\functions\fn_arrayValues.sqf);
__cppfln(FUNC(THIS_MODULE,attachPoint),core\THIS_MODULE\functions\fn_attachPoint.sqf);
__cppfln(FUNC(THIS_MODULE,displayTime),core\THIS_MODULE\functions\fn_displayTime.sqf);
__cppfln(FUNC(THIS_MODULE,empty),core\THIS_MODULE\functions\fn_empty.sqf);
__cppfln(FUNC(THIS_MODULE,mandoChute),core\THIS_MODULE\functions\fn_mandoChute.sqf);
__cppfln(FUNC(THIS_MODULE,numbersToWords),core\THIS_MODULE\functions\fn_numbersToWords.sqf);
__cppfln(FUNC(THIS_MODULE,paradrop),core\THIS_MODULE\functions\fn_paradrop.sqf);
__cppfln(FUNC(THIS_MODULE,players),core\THIS_MODULE\functions\fn_players.sqf);
__cppfln(FUNC(THIS_MODULE,safePos),core\THIS_MODULE\functions\fn_safePos.sqf);
__cppfln(FUNC(THIS_MODULE,time),core\THIS_MODULE\functions\fn_time.sqf);

if (isServer) then {
    __corePP(server);
};

if (hasInterface) then {
    __corePP(client);
};

__coreVM(helper);
__coreVM(network);

__ccppfln(core\THIS_MODULE\modules.sqf);
__ccppfln(core\THIS_MODULE\handlers.sqf);

if (isDedicated) then {
    if (!isNil QMODULE(vehicle)) then {
        {
            [_x] __handler("vehicle");
        } forEach vehicles;
    };
};

MODULE(THIS_MODULE) = true;