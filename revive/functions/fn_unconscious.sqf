#define THIS_MODULE revive
#include "x_macros.sqf"
private ["_unit"];

PARAMS_1(_unit);

if !(alive _unit) exitWith {};
if (_unit getVariable QGVAR(unconscious)) exitWith {};

_unit setVariable [QGVAR(unconscious), true, true];

moveOut _unit;

[true, "switchMove", [_unit, ""]] call FUNC(network,mp);

_unit setCaptive true;

showHUD false;
openMap [false, false];

showCommandingMenu "";

if !(isNil QMODULE(communication)) then {
    if !(isNil QMODULE(construction)) then {
        ["Construct", 0] call FUNC(communication,toggle);
    };
    
    if !(isNil QMODULE(gesture)) then {
        ["Gestures", 0] call FUNC(communication,toggle);
    };
    
    if !(isNil QMODULE(perk)) then {
        ["Radio", 0] call FUNC(communication,toggle);
    };
};

_unit spawn {
    sleep 0.5;

    if !(alive _this) exitWith {};
    
    _this setDamage 0;
    
    if !([_this, vehicle _this] call BIS_fnc_areEqual) then {
        _this action ["Eject", vehicle _this];
        
        sleep 1;
    };

    if !(alive _this) exitWith {};
    
    [_this, "playActionNow", "Die"] call FUNC(network,mp);

    [true, "systemChat", format ["%1 was incapacitated", name _this]] call FUNC(network,mp);

    [gameLogic, "spawn", [[_this], {
        __log format ["Incapacitated %1", name (_this select 0)]];

        if !(isNil QMODULE(database)) then {
            [getPlayerUID (_this select 0), 5] call FUNC(database,statistic);
        };
    }]] call FUNC(network,mp);
    
    sleep 1;

    if !(alive _this) exitWith {};
    
    call FUNC(THIS_MODULE,countdown);
    
    if (alive _this && {!(_this getVariable QGVAR(unconscious))}) then {
        [true, "switchMove", [_this, "AmovPpneMstpSnonWnonDnon_healed"]] call FUNC(network,mp);
        [true, "playMoveNow", [_this, "AmovPpneMstpSnonWnonDnon_healed"]] call FUNC(network,mp);
        
        [_this] call FUNC(THIS_MODULE,reset);
        
        if !(isNil QMODULE(communication)) then {
            if !(isNil QMODULE(construction) && {count BIS_MENU_Construct > 1}) then {
                ["Construct", 1] call FUNC(communication,toggle);
            };

            if !(isNil QMODULE(gesture) && {count BIS_MENU_Gestures > 1}) then {
                ["Gestures", 1] call FUNC(communication,toggle);
            };

            if !(isNil QMODULE(perk) && {count BIS_MENU_Radio > 1}) then {
                ["Radio", 1] call FUNC(communication,toggle);
            };
        };
    };
};