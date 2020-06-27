#include "x_macros.sqf"
private ["_vehicle"];

PARAMS_1(_vehicle);

{
    if (_x isKindOf "CAManBase") then {
        _x setDamage 1;
    };
    
    if (_x isKindOf "LandVehicle") then {
        {
            _x setDamage 1;
            
            deleteVehicle _x;
        } forEach crew _x;
    };

    deleteVehicle _x;
} forEach (_vehicle getVariable QGVAR(cleanup));

_vehicle setVariable [QGVAR(cleanup), []];