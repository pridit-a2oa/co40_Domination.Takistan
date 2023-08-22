#include "x_macros.sqf"
private ["_type"];

PARAMS_1(_type);

_type = switch (typeName _type) do {
    case "ARRAY": {
        [_type select 0, (_type select 1) select 0]
    };

    case "STRING": {
        [_type]
    };
};

_type