#define THIS_MODULE construction
#include "x_macros.sqf"
private ["_type", "_object"];

PARAMS_2(_type, _object);

switch (_type) do {
    if (!isNil QMODULE(vehicle_repair)) then {
        case "FARP": {
            [_object] __submodulePP(vehicle_repair);
        };
    };
    
    if (!isNil QMODULE(medical)) then {
        case "MASH": {
            [_object] __submodulePP(medical);
        };
    };
};