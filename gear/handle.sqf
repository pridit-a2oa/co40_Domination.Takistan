/**
 * Gear Module (Handler)
 */

#define THIS_MODULE gear
#include "x_macros.sqf"

if !(hasInterface) exitWith {};
if (isNil QMODULE(database)) exitWith {};

0 spawn {
    while {true} do {
        private ["_gear"];

        waitUntil {
            sleep 1;

            !isNull (findDisplay 106);
        };

        _gear = [magazines player, weapons player];

        waitUntil {
            sleep 1;

            isNull (findDisplay 106);
        };

        if !([[magazines player, weapons player], _gear] call BIS_fnc_areEqual) then {
            [gameLogic, "spawn", [[player, [getPlayerUID player, name player]], {
                private ["_unit", "_identifier", "_key", "_gear"];

                PARAMS_2(_unit, _identifier);

                _key = _identifier call FUNC(THIS_MODULE,key);

                _gear = [magazines _unit, weapons _unit];

                if ([_gear, [[], []]] call BIS_fnc_areEqual) exitWith {};

                serverNamespace setVariable [
                    _key,
                    [
                        (serverNamespace getVariable _key) select 0,
                        _gear
                    ]
                ];
            }]] call FUNC(network,mp);
        };
    };
};