private ["_vehicles"];

_vehicles = [];

{
    private ["_valid"];
    
    _valid = switch (true) do {
        case (_x isKindOf "Thing" && {!(_x isKindOf "Wreck")});
        case (_x isKindOf "StaticWeapon");
        case ([typeOf _x, "ClutterCutter_EP1"] call BIS_fnc_areEqual): {
            false
        };
        
        default {true}
    };

    if (_valid) then {
        [_vehicles, _x] call BIS_fnc_arrayPush;
    };
} forEach vehicles;

_vehicles