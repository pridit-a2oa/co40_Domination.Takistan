#include "x_macros.sqf"
private ["_vehicle", "_magazine"];

PARAMS_2(_vehicle, _magazine);

_vehicle removeMagazines _magazine;

[true, "vehicleChat", [_vehicle, format ["Rearming %1", _magazine]]] call FUNC(network,mp);

sleep 6;

_vehicle addMagazine _magazine;

sleep 1;