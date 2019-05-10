#include "x_macros.sqf"
private ["_car", "_explosive"];

PARAMS_1(_car);

sleep 1;

_car spawn {
    while {alive _this && {alive (driver _this)}} do {
        [nil, _this, rSay, QGVAR(sound_tick), 20] call RE;
        
        sleep 0.5;
    };
};

sleep 5;

if (!alive (driver _car)) exitWith {
    _car setDamage 1;
};

[nil, nil, rSpawn, [driver _car], {(_this select 0) directSay "Exclamation"}] call RE;

sleep 1.5;

_explosive = createVehicle [GVAR(intel_type_bomb), position _car, [], 0, "CAN_COLLIDE"];

{
    _x setDamage 1;
    
    if (_x isKindOf "AllVehicles") then {
        {
            _x setDamage 1;
        } forEach crew _x;
    };
} forEach (nearestObjects [_car, ["Man", "AllVehicles"], 12]);