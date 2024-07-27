/**
 * Chat Module (Handler)
 */

#define THIS_MODULE chat
#include "x_macros.sqf"

if (isServer) then {
    if !(isNil QMODULE(database)) then {
        __submodulePP(database);
    };
};

if (hasInterface) then {
    waitUntil {sleep 0.1; !isNil {X_JIPH getVariable QGVAR(mutes)}};

    if ([[X_JIPH getVariable QGVAR(mutes), getPlayerUID player] call BIS_fnc_findNestedElement, []] call BIS_fnc_areEqual) exitWith {};

    0 spawn {
        while {true} do {
            private ["_ctrl"];

            42555 cutRsc ["XD_ChatDialog", "PLAIN"];

            waitUntil {
                sleep 0.05;

                !isNull (findDisplay 24);
            };

            _ctrl = (findDisplay 24) displayCtrl 101;

            {
                _ctrl ctrlRemoveAllEventHandlers _x;
            } forEach ["KeyDown", "KeyUp", "Char"];

            {
                _ctrl ctrlAddEventHandler [
                    _x,
                    "(_this select 0) ctrlSetText ''; true"
                ];
            } forEach ["KeyDown", "KeyUp", "Char"];

            DIALOG("X_CHAT_DIALOG", 100) ctrlSetText "You are banned from text chat";
            DIALOG("X_CHAT_DIALOG", 1000) ctrlSetText "ca\ui\data\cmdbar_unarmed_ca";

            waitUntil {
                sleep 0.05;

                isNull _ctrl;
            };

            DIALOG("X_CHAT_DIALOG", 100) ctrlSetText "";
            DIALOG("X_CHAT_DIALOG", 1000) ctrlSetText "";
        };
    };
};