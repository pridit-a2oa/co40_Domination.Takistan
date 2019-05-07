#include "x_macros.sqf"
private ["_vehicle", "_magazine"];

PARAMS_2(_vehicle, _magazine);

_vehicle removeMagazines _magazine;
_vehicle vehicleChat format ["Rearming %1", _magazine];

sleep 6;

_vehicle addMagazine _magazine;

sleep 1;