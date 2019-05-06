#include "x_macros.sqf"
private ["_vehicle", "_axis"];

PARAMS_1(_vehicle);

_axis = switch (true) do {
    case (typeOf _vehicle == "Mi24_D_TK_EP1"):  {[0, 9],    [0, -1]};
    case (typeOf _vehicle == "A10_US_EP1"):     {[0, 8],    [0, -1]};
    case (typeOf _vehicle == "Mi17_base"):      {[0, 8],    [0, 0]};
    case (typeOf _vehicle == "MQ9PredatorB"):   {[0, 5.5],  [0, -1]};
    case (typeOf _vehicle == "C130J_US_EP1"):   {[0, 15],   [0, -5]};
    default                                     {[0, 8],    [0, 0]};
};

_axis