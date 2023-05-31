#include "x_macros.sqf"
private ["_vehicle", "_type"];

PARAMS_1(_vehicle);

_type = getText (configFile >> "CfgVehicles" >> _vehicle >> "TextSingular");

switch (_type) do {
    case "Airplane": {
        _type = "Plane";
    };

    case "Truck": {
        _type = "Car";
    };
};

_type