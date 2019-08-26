#define THIS_MODULE revive
#include "x_macros.sqf"
private ["_unit"];

PARAMS_1(_unit);

_unit setVariable [QGVAR(unconscious), true, true];

moveOut _unit;

_unit switchMove "";
_unit setUnconscious true;
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
        if (!(_this getVariable QGVAR(unconscious))) exitWith {
            [true, "switchMove", [_this, "AmovPpneMstpSnonWnonDnon_healed"]] call FUNC(network,mp);
            [true, "playMoveNow", [_this, "AmovPpneMstpSnonWnonDnon_healed"]] call FUNC(network,mp);
            
            [_this] call FUNC(THIS_MODULE,reset);
        };
        
        sleep 1;
    };
};

[true, "systemChat", format ["%1 is unconscious", name _unit]] call FUNC(network,mp);