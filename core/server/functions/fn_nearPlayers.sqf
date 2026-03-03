#include "x_macros.sqf"
private ["_position", "_range", "_foot", "_single", "_players", "_vehicles"];

PARAMS_1(_position);

_range = [_this, 1, 25] call FUNC(common,param);
_foot = [_this, 2, true] call FUNC(common,param);
_single = [_this, 3, true] call FUNC(common,param);

_players = [];

_vehicles = nearestObjects [_position, ["AllVehicles"], _range];

if ([count _vehicles, 0] call BIS_fnc_areEqual) exitWith {[]};

{
    switch (true) do {
        case (_x isKindOf "CAManBase" && {isPlayer _x && {alive _x}}): {
            [_players, [getPlayerUID _x, name _x]] call BIS_fnc_arrayPush;
        };

        case (!_foot && {[vehicle _x, _x] call BIS_fnc_areEqual && {{isPlayer _x} count crew _x > 0}}): {
            {
                if (isPlayer _x && {alive _x}) then {
                    [_players, [getPlayerUID _x, name _x]] call BIS_fnc_arrayPush;
                };
            } forEach crew _x;
        };
    };
} forEach _vehicles;

if ([_players, []] call BIS_fnc_areEqual) exitWith {[]};

if (_single) then {
    _players resize 1;
};

_players