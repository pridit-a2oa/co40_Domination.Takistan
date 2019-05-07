/**
 * Vehicle Repair, Refuel, Rearm Pad
 *
 * Original authors: =7Cav=CW2.Iher.I & Xeno
 */

#define THIS_MODULE vehicle_service
#include "x_macros.sqf"
private ["_vehicle"];

PARAMS_1(_vehicle);

while {alive _vehicle && {fuel _vehicle < 0.99}} do {
    _vehicle setFuel 0;
    _vehicle setVehicleAmmo 1;
    
    sleep 1;

    _magazines = getArray (configFile >> "CfgVehicles" >> (typeOf _vehicle) >> "magazines");

    if (count _magazines > 0) then {
        {
            [_vehicle, _x] call FUNC(THIS_MODULE,rearm);
        } forEach _magazines;
    };
    
    _turrets = count (configFile >> "CfgVehicles" >> (typeOf _vehicle) >> "Turrets");
    
    for "_i" from 0 to (_turrets - 1) do {
        _config = (configFile >> "CfgVehicles" >> (typeOf _vehicle) >> "Turrets") select _i;
        _magazines = getArray (_config >> "magazines");
        
        {
            [_vehicle, _x] call FUNC(THIS_MODULE,rearm);
        } forEach _magazines;
        
        for "_i" from 0 to ((count (_config >> "Turrets")) - 1) do {
            _magazines = getArray (((_config >> "Turrets") select _i) >> "magazines");
            
            {
                [_vehicle, _x] call FUNC(THIS_MODULE,rearm);
            } forEach _magazines;
        };
    };

    _vehicle setVehicleAmmo 1;

    if (damage _vehicle >= 0.01) then {
        _vehicle vehicleChat "Repairing";
        
        while {damage _vehicle > 0.01} do {
            _vehicle setDamage ((damage _vehicle) - 0.01);
            
            sleep 0.1;
        };
    };
    
    _vehicle vehicleChat "Refuelling";
    
    while {fuel _vehicle < 0.99} do {
        _vehicle setFuel ((fuel _vehicle) + 0.01);
        
        sleep 0.1;
    };
    
    reload _vehicle;
};