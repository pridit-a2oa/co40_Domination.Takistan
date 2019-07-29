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
    
    [nil, _this, rPlayActionNow, "Die"] call RE;
    
    sleep 1;
    
    call FUNC(THIS_MODULE,countdown);
    
    while {alive _this} do {
        if (!(_this getVariable QGVAR(unconscious))) exitWith {
            [nil, _this, rSwitchMove, "AmovPpneMstpSnonWnonDnon_healed"] call RE;
            [nil, _this, rPlayMoveNow, "AmovPpneMstpSnonWnonDnon_healed"] call RE;
            
            [_this] call FUNC(THIS_MODULE,reset);
        };
        
        sleep 1;
    };
};

[nil, nil, rSpawn, [_unit], {systemChat format ["%1 is unconscious", name (_this select 0)]}] call RE;