#define THIS_MODULE vehicle_loadout
#include "x_macros.sqf"
private ["_vehicle", "_service", "_weapons"];

PARAMS_2(_vehicle, _service);

if (isNil "_service") then {
    _service = false;
};

_weapons = (_vehicle getVariable QGVAR(loadout)) select 1;

{
    private ["_magazine"];

    if (typeName (_x select 0) == "ARRAY") then {
        _magazine = (_x select 0) select 1;
    } else {
        _magazine = getArray (configFile >> "CfgWeapons" >> _x select 0 >> "magazines");
    };

    for "_i" from 1 to (_x select 1) do {
        private ["_type", "_path"];

        _type = if (typeName (_x select 0) == "ARRAY") then {_magazine} else {_magazine select 0};
        _path = if (isNil {(_x select 2)}) then {[-1]} else {_x select 2};
        
        if (!isNil QMODULE(vehicle_service) && {_service}) then {
            [_vehicle, _type, _path] call FUNC(vehicle_service,rearm);
        } else {
            [
                [_vehicle, _path] call FUNC(vehicle,owner),
                "addMagazineTurret",
                [_vehicle, _type, _path]
            ] call FUNC(network,mp);
        };
    };
} forEach _weapons;