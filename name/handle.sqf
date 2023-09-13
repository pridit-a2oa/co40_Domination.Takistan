/**
 * Name Module (Handler)
 */

#define THIS_MODULE name
#include "x_macros.sqf"

if (hasInterface) then {
    ["marker_players", {
        {
            private ["_marker"];

            _marker = [format ["player_%1", name _x]] call FUNC(THIS_MODULE,valid);

            switch (isNil "_marker") do {
                case true: {
                    if !(isPlayer _x) exitWith {};

                    [_x] call FUNC(THIS_MODULE,create);
                };

                case false: {
                    _marker setMarkerPosLocal (getPosASL _x);

                    if !(alive _x) exitWith {
                        _marker setMarkerColorLocal "ColorBlack";
                        _marker setMarkerAlphaLocal 0.6;
                    };

                    if (!isNil QMODULE(revive) && {[_x] __submodulePP(revive)}) exitWith {};

                    _marker setMarkerColorLocal "ColorGreen";
                    _marker setMarkerAlphaLocal 1;
                };
            };
        } forEach (call FUNC(common,players));
    }, 1] call FUNC(client,addPerFrame);
};