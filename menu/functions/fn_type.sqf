#include "x_macros.sqf"
private ["_entity"];

_entity = [_this, 0, GVAR(menu_entity)] call FUNC(common,param);

switch (true) do {
    case (_entity isKindOf "CAManBase" && {alive _entity}): {
        [
            if (isPlayer _entity) then {"player"} else {"unit"},
            if (isPlayer _entity) then {name _entity} else {[typeOf _entity] call FUNC(vehicle,name)},
            getText (configFile >> "CfgVehicles" >> (typeOf _entity) >> "portrait")
        ]
    };

    case (_entity isKindOf "Air");
    case (_entity isKindOf "LandVehicle"): {
        [
            "vehicle",
            getText (configFile >> "CfgVehicles" >> (typeOf _entity) >> "displayName"),
            getText (configFile >> "CfgVehicles" >> (typeOf _entity) >> "picture")
        ]
    };

    default {[]};
};