#include "x_macros.sqf"
private ["_position", "_distance", "_time", "_entities"];

PARAMS_4(_position, _distance, _time, _entities);

if ([_entities, []] call BIS_fnc_areEqual) exitWith {};

sleep _time;

waitUntil {
    sleep 20;

    [{(_x distance _position) < _distance} count (call FUNC(common,players)), 0] call BIS_fnc_areEqual
};

{
    switch (true) do {
        case (_x isKindOf "CAManBase");
        case (_x isKindOf "LandVehicle" && {(position _x) distance _position < _distance});
        case (_x isKindOf "ReammoBox"): {
            {
                if !(isPlayer _x) then {
                    _x setDamage 1;

                    deleteVehicle _x;
                };
            } forEach crew _x;

            _x setDamage 1;

            deleteVehicle _x;
        };

        case (_x isKindOf "Static");
        case (_x isKindOf "Thing"): {
            deleteVehicle _x;
        };
    };
} forEach _entities;