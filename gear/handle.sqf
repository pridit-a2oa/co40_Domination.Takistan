/**
 * Gear Module (Handler)
 */

#define THIS_MODULE gear
#include "x_macros.sqf"

if (hasInterface) then {
    [gameLogic, "execVM", [[player, [getPlayerUID player, name player]], __function(restore)]] call FUNC(network,mp);

    0 spawn {
        while {true} do {
            waitUntil {
                sleep 2;

                !isNull (findDisplay 106);
            };

            waitUntil {
                sleep 2;

                isNull (findDisplay 106);
            };

            [gameLogic, "spawn", [[player, [getPlayerUID player, name player]], {
                private ["_unit", "_identifier", "_key"];

                PARAMS_2(_unit, _identifier);

                _key = _identifier call FUNC(THIS_MODULE,key);

                serverNamespace setVariable [
                    _key,
                    [
                        (serverNamespace getVariable _key) select 0,
                        [magazines _unit, weapons _unit]
                    ]
                ];
            }]] call FUNC(network,mp);

            sleep 5;
        };
    };
};