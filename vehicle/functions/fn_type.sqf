#include "x_macros.sqf"
private ["_vehicle", "_type", "_icon"];

PARAMS_1(_vehicle);

_type = getText (configFile >> "CfgVehicles" >> _vehicle >> "TextSingular");

switch (_type) do {
    case "Airplane": {
        _type = "Plane";
    };

    case "Truck": {
        _icon = "\ca\ui\data\icontruck_ca.paa";
    };

    case "UAV": {
        _icon = getText (configFile >> "CfgVehicles" >> _vehicle >> "icon");
    };
};

if (isNil "_icon") then {
    _icon = getText (configFile >> "CfgVehicleIcons" >> format ["icon%1", _type]);
};

[_type, _icon]