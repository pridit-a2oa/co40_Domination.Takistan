#include "x_macros.sqf"
private ["_player", "_vehicles"];

_player = objNull;
_vehicles = nearestObjects [GVAR(base_rd), ["AllVehicles"], 25];

if (count _vehicles > 0) then {
    {
        if (_x isKindOf "CAManBase" && {isPlayer _x}) exitWith {
            _player = getPlayerUID _x;
        };

        if ([vehicle _x, _x] call BIS_fnc_areEqual && {{isPlayer _x} count crew _x > 0}) exitWith {
            _player = getPlayerUID (driver _x);
        };
    } forEach _vehicles;
};

_player