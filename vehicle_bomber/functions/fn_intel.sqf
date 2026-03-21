#define THIS_MODULE vehicle_bomber
#include "x_macros.sqf"
private ["_vehicle", "_alternate"];

PARAMS_2(_vehicle, _alternate);

if !([_vehicle] call FUNC(THIS_MODULE,valid)) exitWith {};

if (hasInterface) then {
    if (isNil "_alternate") then {
        _alternate = switch (true) do {
            case (!isNil QMODULE(item) && {!isNil QMODULE(item_money) && {__submodulePP(item)}}): {true};
            default {false};
        };

        _this set [1, _alternate];
    };

    if !(isNil QMODULE(accolade)) then {
        [gameLogic, "execVM", [[["logistic", "Novice"], [getPlayerUID player, name player]], FUNCTION(accolade,set)]] call FUNC(network,mp);
    };

    if !(isServer) then {
        [gameLogic, "execVM", [_this, __function(intel)]] call FUNC(network,mp);
    };
};

if (isServer && {_vehicle getVariable QGVAR(bomber)}) then {
    private ["_type"];

    _vehicle setVariable [QGVAR(bomber), false, true];

    _type = switch (_alternate) do {
        case true: {__submodulePP(investigation)};
        case false: {[]};
    };

    if ([_type, []] call BIS_fnc_areEqual && {GVAR(vehicle_bomber_chance_detonate) > floor (random 100)}) exitWith {
        [_vehicle] spawn FUNC(THIS_MODULE,timer);
    };

    sleep 5;

    if !([_vehicle] call FUNC(THIS_MODULE,valid)) exitWith {};

    if !(isNil QMODULE(investigation)) then {
        _type spawn FUNC(investigation,create);
    };

    sleep 2;

    [_vehicle] call FUNC(THIS_MODULE,remove);
};