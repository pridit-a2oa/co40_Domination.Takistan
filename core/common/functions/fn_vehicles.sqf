private ["_vehicles"];

_vehicles = [];

{
    switch (true) do {
        case (_x isKindOf "Thing" && {!(_x isKindOf "Wreck")});
        case ([typeOf _x, "ClutterCutter_EP1"] call BIS_fnc_areEqual): {};

        default {
            [_vehicles, _x] call BIS_fnc_arrayPush;
        };
    };
} forEach vehicles;

_vehicles