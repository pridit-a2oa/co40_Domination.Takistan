#include "x_macros.sqf"
private ["_position", "_entities"];

PARAMS_2(_position, _entities);

sleep GVAR(event_time_cleanup);

waitUntil {
    sleep 20;
    
    [{(_x distance _position) < GVAR(event_distance_cleanup)} count (call FUNC(common,players)), 0] call BIS_fnc_areEqual
};

{
    switch (true) do {
        case (_x isKindOf "CAManBase");
        case (_x isKindOf "LandVehicle" && {(position _x) distance _position < 50});
        case (_x isKindOf "ReammoBox");
        case (_x isKindOf "StaticWeapon"): {
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