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
    sleep 0.2;
    
    if (vehicle _this != _this) then {
        _this action ["Eject", vehicle _this];
    };
    
    [nil, _this, rPlayActionNow, "Die"] call RE;
    
    titleText ["", "BLACK", 1];
    
    sleep 1;
    
    titleText ["You are unconscious\n\n\nYou can wait to be revived or\nrespawn through the Escape menu", "BLACK FADED"];
    
    sleep 6;
    
    titleText ["", "BLACK IN", 3];
    
    while {alive _this} do {
        if (!(_this getVariable QGVAR(unconscious))) exitWith {
            [nil, _this, rSwitchMove, "AmovPpneMstpSnonWnonDnon_healed"] call RE;
            [nil, _this, rPlayMoveNow, "AmovPpneMstpSnonWnonDnon_healed"] call RE;
            
            _this setUnconscious false;
            _this setCaptive false;
            
            [_this] call FUNC(THIS_MODULE,reset);
        };
        
        sleep 1;
    };
};

[nil, nil, rSpawn, [_unit], {systemChat format ["%1 is unconscious", name (_this select 0)]}] call RE;