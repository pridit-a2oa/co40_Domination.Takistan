/**
 * Chat Module (Handler)
 */

#define THIS_MODULE chat
#include "x_macros.sqf"

if (hasInterface) then {
    0 spawn {
        while {true} do {
            aniChatEvents_chatMessage = "";
            
            waitUntil {!isNil {findDisplay 24}};
            
            _idd = findDisplay 24;
            
            _ctrl = _idd displayCtrl 101;
            _ctrl ctrlAddEventHandler ["keyUp", "aniChatEvents_chatMessage = ctrlText (_this select 0); aniChatEvents_chatChannel = ctrlText ((findDisplay 63) displayCtrl 101);"];

            waitUntil {isNull _ctrl};
            
            if (aniChatEvents_chatMessage != "") then {
                {
                    if ([aniChatEvents_chatMessage, _x] call KRON_StrInStr) exitWith {
                        [nil, gameLogic, "loc", rSpawn, player, {
                            __log format ["%1", owner player]];
                        }] call RE;
                    };
                } forEach GVAR(chat_blacklisted);
            };
        };
    };
};