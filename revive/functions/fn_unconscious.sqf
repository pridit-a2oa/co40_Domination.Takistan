#define THIS_MODULE revive
#include "x_macros.sqf"
private ["_unit"];

PARAMS_1(_unit);

if (_unit getVariable QGVAR(unconscious)) exitWith {};

_unit setVariable [QGVAR(unconscious), true, true];

moveOut _unit;

[true, "switchMove", [_unit, ""]] call FUNC(network,mp);

_unit setCaptive true;

showHUD false;
openMap [false, false];

showCommandingMenu "";

if (!isNil QMODULE(communication)) then {
    if (!isNil QMODULE(construction)) then {
        ["Construct", 0] call FUNC(communication,toggle);
    };
    
    if (!isNil QMODULE(gesture)) then {
        ["Gestures", 0] call FUNC(communication,toggle);
    };
    
    if (!isNil QMODULE(perk)) then {
        ["Radio", 0] call FUNC(communication,toggle);
    };
};

_unit spawn {
    sleep 0.5;

    if !(alive _this) exitWith {};
    
    _this setDamage 0;
    
    if (vehicle _this != _this) then {
        _this action ["Eject", vehicle _this];
        
        sleep 1;
    };

    if !(alive _this) exitWith {};
    
    [_this, "playActionNow", "Die"] call FUNC(network,mp);

    [true, "systemChat", format ["%1 is unconscious", name _this]] call FUNC(network,mp);
    
    sleep 1;

    if !(alive _this) exitWith {};
    
    call FUNC(THIS_MODULE,countdown);
    
    if (alive _this && {!(_this getVariable QGVAR(unconscious))}) then {
        [true, "switchMove", [_this, "AmovPpneMstpSnonWnonDnon_healed"]] call FUNC(network,mp);
        [true, "playMoveNow", [_this, "AmovPpneMstpSnonWnonDnon_healed"]] call FUNC(network,mp);
        
        [_this] call FUNC(THIS_MODULE,reset);
    };
};