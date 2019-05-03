#include "x_macros.sqf"
private ["_type", "_object"];

PARAMS_2(_type, _object);

switch (_type) do {
    if (!isNil QMODULE(vehicle_service)) then {
        case "farp": {
            _object addAction ["Replenish Repair Kits" call FUNC(common,OliveText), FUNCTION(vehicle_service,replenish), [], 2, false, true, "", "player getVariable 'd_repair_kits' < 1 && {player getVariable 'd_repair_kits_max' > 0}"];
        };
    };
    
    if (!isNil QMODULE(medical)) then {
        case "mash": {
            _object addAction ["Replenish Medkits" call FUNC(common,OliveText), FUNCTION(medical,replenish), [], 2, false, true, "", "player getVariable 'd_medkits' < 1 && {player getVariable 'd_medkits_max' > 0}"];
        };
    };
};