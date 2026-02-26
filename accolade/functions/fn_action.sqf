#define THIS_MODULE accolade
#include "x_macros.sqf"
private ["_entry", "_identifier", "_checks"];

PARAMS_1(_entry);

if !(hasInterface) exitWith {};

_identifier = [_this, 1, [getPlayerUID player, name player]] call FUNC(common,param);

_checks = [
    [
        ["Task action", "used"],
        player getVariable QGVAR(accolade_cooldown)
    ] call FUNC(helper,timeExceeded)
];

{
    if ([typeName _x, "STRING"] call BIS_fnc_areEqual) exitWith {
        [_x] call FUNC(client,hint);
    };
} forEach _checks;

if ({[_x, true] call BIS_fnc_areEqual} count _checks < count _checks) exitWith {};

player setVariable [QGVAR(accolade_cooldown), time + GVAR(accolade_time_cooldown)];

if (!isServer || {(isServer && {hasInterface})}) then {
    _this set [0, call compile _entry];
    _this set [1, _identifier];

    [gameLogic, "execVM", [_this, __function(set)]] call FUNC(network,mp);
};