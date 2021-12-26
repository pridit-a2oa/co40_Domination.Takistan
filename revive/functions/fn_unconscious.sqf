#define THIS_MODULE revive
#include "x_macros.sqf"
private ["_unit"];

PARAMS_1(_unit);

_unit setVariable [QGVAR(unconscious), true, true];

moveOut _unit;

_unit switchMove "";
_unit setCaptive true;

_unit spawn {
    sleep 0.5;
    
    _this setDamage 0;
    
    if (vehicle _this != _this) then {
        _this action ["Eject", vehicle _this];
        
        sleep 1;
    };
    
    [_this, "playActionNow", "Die"] call FUNC(network,mp);
    
    sleep 1;
    
    call FUNC(THIS_MODULE,countdown);
    
    if (alive _this && {!(_this getVariable QGVAR(unconscious))}) then {
        [true, "switchMove", [_this, "AmovPpneMstpSnonWnonDnon_healed"]] call FUNC(network,mp);
        [true, "playMoveNow", [_this, "AmovPpneMstpSnonWnonDnon_healed"]] call FUNC(network,mp);
        
        [_this] call FUNC(THIS_MODULE,reset);
    };
    
    if (!isNil QMODULE(communication)) then {
        if (!isNil QMODULE(construction) && {count BIS_MENU_Construct > 1}) then {
            ["Construct", 1] call FUNC(communication,toggle);
        };
        
        if (!isNil QMODULE(gesture)) then {
            ["Gestures", 1] call FUNC(communication,toggle);
        };
        
        if (!isNil QMODULE(perk) && {count BIS_MENU_Radio > 1}) then {
            ["Radio", 1] call FUNC(communication,toggle);
        };
    };
};

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

[true, "systemChat", format ["%1 is unconscious", name _unit]] call FUNC(network,mp);