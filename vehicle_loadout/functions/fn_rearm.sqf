#define THIS_MODULE vehicle_loadout
#include "x_macros.sqf"
private ["_vehicle", "_service", "_weapons", "_magazine", "_type"];

PARAMS_2(_vehicle, _service);

if (isNil "_service") then {
    _service = false;
};

[true, "setVehicleAmmo", [_vehicle, 0]] call FUNC(network,mp);

_weapons = (_vehicle getVariable QGVAR(loadout)) select 1;

{
    if (typeName (_x select 0) == "ARRAY") then {
        _magazine = (_x select 0) select 1;
    } else {
        _magazine = getArray (configFile >> "CfgWeapons" >> _x select 0 >> "magazines");
    };

    for "_i" from 1 to (_x select 1) do {
        _type = if (typeName (_x select 0) == "ARRAY") then {_magazine} else {_magazine select 0};
        
        if (!isNil QMODULE(vehicle_service) && {_service}) then {
            [_vehicle, _type] call FUNC(vehicle_service,rearm);
        } else {
            [_vehicle, "addMagazine", _type] call FUNC(network,mp);
        };
    };
} forEach _weapons;