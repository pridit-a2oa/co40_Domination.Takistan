#include "x_macros.sqf"
private ["_vehicle", "_magazine"];

PARAMS_2(_vehicle, _magazine);

if (isNil {_vehicle getVariable QGVAR(loadout)}) then {
    [_vehicle, "removeMagazines", _magazine] call FUNC(network,mp);
};

[true, "vehicleChat", [_vehicle, format ["Rearming %1", _magazine]]] call FUNC(network,mp);

sleep 6;

[_vehicle, "addMagazine", _magazine] call FUNC(network,mp);

sleep 1;