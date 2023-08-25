#define THIS_MODULE vehicle_bomber
#include "x_macros.sqf"
private ["_vehicle", "_type"];

PARAMS_2(_vehicle, _type);

if (isNil "_type" && {!(_vehicle getVariable QGVAR(bomber))}) exitWith {};

if (hasInterface) then {
    _vehicle setVariable [QGVAR(bomber), false, true];

    if (isNil "_type") then {
        _type = switch (true) do {
            case (!isNil QMODULE(item) && {!isNil QMODULE(item_money) && {__submodulePP(item)}}): {__submodulePP(mission_mini)};
            default {[]}
        };

        _this set [1, _type];
    };
};

if !(isServer) exitWith {
    [gameLogic, "execVM", [_this, __function(intel)]] call FUNC(network,mp);
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