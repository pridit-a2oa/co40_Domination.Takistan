#define THIS_MODULE intel
#include "x_macros.sqf"
private ["_vehicle", "_explosive"];

PARAMS_1(_vehicle);

[driver _vehicle] joinSilent (createGroup east);

sleep 1;

_vehicle spawn {
    while {alive (driver _this)} do {
        [true, "say", [_this, QGVAR(sound_tick), 20]] call FUNC(network,mp);
        
        if (damage _this > 0.5 || {!canMove _this} || {!([_this] call FUNC(common,canMove))}) exitWith {
            [_this] spawn FUNC(THIS_MODULE,detonate);
        };
        
        sleep 0.5;
    };
};

sleep 5;

if (!alive (driver _vehicle)) exitWith {};

[true, "directSay", [driver _vehicle, "Exclamation"]] call FUNC(network,mp);

sleep 1.5;

[_vehicle] spawn FUNC(THIS_MODULE,detonate);