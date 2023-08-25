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
__ccppfln(core\THIS_MODULE\scripts\KRON.sqf);

__cppfln(FUNC(THIS_MODULE,arrayPushStack),core\THIS_MODULE\functions\fn_arrayPushStack.sqf);
__cppfln(FUNC(THIS_MODULE,arrayValues),core\THIS_MODULE\functions\fn_arrayValues.sqf);
__cppfln(FUNC(THIS_MODULE,attachPoint),core\THIS_MODULE\functions\fn_attachPoint.sqf);
__cppfln(FUNC(THIS_MODULE,canMove),core\THIS_MODULE\functions\fn_canMove.sqf);
__cppfln(FUNC(THIS_MODULE,deleteAt),core\THIS_MODULE\functions\fn_deleteAt.sqf);
__cppfln(FUNC(THIS_MODULE,displayTime),core\THIS_MODULE\functions\fn_displayTime.sqf);
__cppfln(FUNC(THIS_MODULE,empty),core\THIS_MODULE\functions\fn_empty.sqf);
__cppfln(FUNC(THIS_MODULE,mandoChute),core\THIS_MODULE\functions\fn_mandoChute.sqf);
__cppfln(FUNC(THIS_MODULE,nearestLocation),core\THIS_MODULE\functions\fn_nearestLocation.sqf);
__cppfln(FUNC(THIS_MODULE,numbersToWords),core\THIS_MODULE\functions\fn_numbersToWords.sqf);
__cppfln(FUNC(THIS_MODULE,paradrop),core\THIS_MODULE\functions\fn_paradrop.sqf);
__cppfln(FUNC(THIS_MODULE,param),core\THIS_MODULE\functions\fn_param.sqf);
__cppfln(FUNC(THIS_MODULE,players),core\THIS_MODULE\functions\fn_players.sqf);
__cppfln(FUNC(THIS_MODULE,ready),core\THIS_MODULE\functions\fn_ready.sqf);
__cppfln(FUNC(THIS_MODULE,safePos),core\THIS_MODULE\functions\fn_safePos.sqf);
__cppfln(FUNC(THIS_MODULE,time),core\THIS_MODULE\functions\fn_time.sqf);
__cppfln(FUNC(THIS_MODULE,vehicles),core\THIS_MODULE\functions\fn_vehicles.sqf);

// override BIS function
BIS_fnc_findNestedElement = compile preprocessFile "core\common\functions\fn_findNestedElement.sqf";

__corePP(helper);
__corePP(network);

if (isServer) then {
    __corePP(server);
};

if (hasInterface) then {
    __corePP(client);
};

__ccppfln(core\THIS_MODULE\modules.sqf);
__ccppfln(core\THIS_MODULE\handlers.sqf);

0 spawn {
    {
        _x allowDamage false;

        sleep 0.01;
    } forEach (nearestObjects [markerPos QGVAR(base_south), ["Building"], 400]);
};

if (hasInterface) then {
    if (!isNil QMODULE(setting)) then {
        player switchCamera ((player getVariable QGVAR(camera)) select 1);
    };

    if (isMultiplayer) then {
        player spawn {
            if (!isNil QMODULE(setting) && {(player getVariable QGVAR(tutorial)) select 1 == 10}) then {
                call FUNC(tutorial,handle);

                waitUntil {sleep 1; !GVAR(tutorial)};
            };
        
            player enableSimulation true;
        
            sleep 1;
            
            titleText ["", "BLACK IN", 4];

            if !(isClass (configFile >> "CfgVehicles" >> "MV22" >> "UserActions")) then {
                "Missing Content" hintC [
                    "This server is enhanced by content from the base game, Arma 2, which has not been detected as part of your install.",
                    "While this is not a requirement to play, you will experience missing content in the form of some weapons & vehicles.",
                    "If this message has displayed in error, and you can see base Arma 2 vehicles such as the MV-22, please report on Discord."
                ];
            };
        };
    };
};

if (isDedicated) then {
    if !(isNil QMODULE(vehicle)) then {
        {
            [_x] spawn FUNC(vehicle,handle);
        } forEach call FUNC(THIS_MODULE,vehicles);
    };
};

MODULE(THIS_MODULE) = true;