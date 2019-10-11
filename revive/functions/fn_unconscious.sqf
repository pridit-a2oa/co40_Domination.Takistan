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
    
    if (vehicle _this != _this) then {
        _this action ["Eject", vehicle _this];
        
        sleep 1;
    };
    
    [_this, "playActionNow", "Die"] call FUNC(network,mp);
    
    sleep 1;
    
    call FUNC(THIS_MODULE,countdown);
    
    while {alive _this} do {
        if !(_this getVariable QGVAR(unconscious)) exitWith {
            [true, "switchMove", [_this, "AmovPpneMstpSnonWnonDnon_healed"]] call FUNC(network,mp);
            [true, "playMoveNow", [_this, "AmovPpneMstpSnonWnonDnon_healed"]] call FUNC(network,mp);
            
            if (!isNil QMODULE(communication)) then {
                if (!isNil QMODULE(construction) && {count BIS_MENU_Construct > 1}) then {
                    ["Construct", 1] call FUNC(communication,toggle);
                };
                
                if (!isNil QMODULE(perk) && {count BIS_MENU_Radio > 1}) then {
                    ["Radio", 1] call FUNC(communication,toggle);
                };
            };
            
            [_this] call FUNC(THIS_MODULE,reset);
        };
        
        sleep 1;
    };
};

showHUD false;
openMap [false, false];

showCommandingMenu "";

if (!isNil QMODULE(communication)) then {
    if (!isNil QMODULE(construction)) then {
        ["Construct", 0] call FUNC(communication,toggle);
    };
    
    if (!isNil QMODULE(perk)) then {
        ["Radio", 0] call FUNC(communication,toggle);
    };
};

[true, "systemChat", format ["%1 is unconscious", name _unit]] call FUNC(network,mp);