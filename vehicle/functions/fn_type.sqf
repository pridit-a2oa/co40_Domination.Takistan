#include "x_macros.sqf"
private ["_vehicle", "_type", "_icon"];

PARAMS_1(_vehicle);

_type = getText (configFile >> "CfgVehicles" >> _vehicle >> "TextSingular");

if ([_type, "Airplane"] call BIS_fnc_areEqual) then {
    _type = "Plane";
};

_icon = switch (_type) do {
    case "Truck": {
        "\ca\ui\data\icontruck_ca.paa";
    };

    default {
        getText (configFile >> "CfgVehicles" >> _vehicle >> "icon");
    };
};

if (isNil "_icon") then {
    _icon = getText (configFile >> "CfgVehicleIcons" >> format ["icon%1", _type]);
};

[_type, _icon]