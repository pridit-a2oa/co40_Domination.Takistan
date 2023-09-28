#define THIS_MODULE vehicle_bomber
#include "x_macros.sqf"
private ["_vehicle", "_alternate", "_type"];

PARAMS_2(_vehicle, _alternate);

if (isNil "_alternate" && {!(_vehicle getVariable QGVAR(bomber))}) exitWith {};

if (hasInterface) then {
    _vehicle setVariable [QGVAR(bomber), false, true];

    if (isNil "_alternate") then {
        _alternate = switch (true) do {
            case (!isNil QMODULE(item) && {!isNil QMODULE(item_money) && {__submodulePP(item)}}): {true};
            default {false}
        };

        _this set [1, _alternate];
    };
};

if !(isServer) exitWith {
    [gameLogic, "execVM", [_this, __function(intel)]] call FUNC(network,mp);
};

_type = switch (_alternate) do {
    case true: {__submodulePP(mission_mini)};
    case false: {[]};
};

if ([_type, []] call BIS_fnc_areEqual && {GVAR(vehicle_bomber_chance_detonate) > floor (random 100)}) exitWith {
    [_vehicle] spawn FUNC(THIS_MODULE,timer);
};

sleep 5;

if !([_vehicle] call FUNC(THIS_MODULE,valid)) exitWith {};

if !(isNil QMODULE(mission_mini)) then {
    _type spawn FUNC(mission_mini,create);
};

sleep 2;

[_vehicle] call FUNC(THIS_MODULE,remove);