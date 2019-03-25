#include "x_macros.sqf"
private ["_vehicle"];
PARAMS_1(_vehicle);

_camo = _vehicle getVariable QGVAR(camo);

// edge case where it might still be destroyed somehow
if (isNil "_camo") then {
    _camo = objNull;
};

if (!isNull _camo) then {
    deleteVehicle _camo;
};

[nil, nil, rEXECVM, __functionRE(vehicle,unlock), _vehicle] call RE;

_vehicle setVariable [QGVAR(deployed), false, true];

closeDialog 0;
call FUNC(vehicle_menu,show);