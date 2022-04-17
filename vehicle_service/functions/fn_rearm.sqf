#include "x_macros.sqf"
private ["_vehicle", "_magazine", "_path"];

PARAMS_3(_vehicle, _magazine, _path);

if (isNil {_vehicle getVariable QGVAR(loadout)}) then {
    [_vehicle, "removeMagazines", _magazine] call FUNC(network,mp);
};

[true, "vehicleChat", [_vehicle, format ["Rearming %1", _magazine]]] call FUNC(network,mp);

sleep 6;

if (isNil "_path") then {
    [_vehicle, "addMagazine", _magazine] call FUNC(network,mp);
} else {
    [
        [_vehicle, _path] call FUNC(vehicle,owner),
        "addMagazineTurret",
        [_vehicle, _magazine, _path]
    ] call FUNC(network,mp);
};

sleep 1;