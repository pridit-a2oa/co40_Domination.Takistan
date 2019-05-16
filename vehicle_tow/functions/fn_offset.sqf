#include "x_macros.sqf"
private ["_vehicle", "_offset"];

PARAMS_1(_vehicle);

_offset = switch (true) do {
    case (typeOf _vehicle == "A10_US_EP1"):         {[[0, 8],    [0, -1]]};
    case (typeOf _vehicle == "C130J_US_EP1"):       {[[0, 15],   [0, -5]]};
    case (typeOf _vehicle == "BAF_Merlin_HC3_D"):   {[[0, 10],   [0, 0]]};
    case (typeOf _vehicle == "CH_47F_EP1"):         {[[0, 10],   [0, 0]]};
    case (typeOf _vehicle == "MH6J_EP1"):           {[[0, 5],    [0, 0]]};
    case (typeOf _vehicle == "Mi17_base"):          {[[0, 8],    [0, 0]]};
    case (typeOf _vehicle == "Mi24_D_TK_EP1"):      {[[0, 9],    [0, -1]]};
    case (typeOf _vehicle == "MV22"):               {[[0, 12],   [0, 0]]};
    case (typeOf _vehicle == "MQ9PredatorB"):       {[[0, 5.5],  [0, -1]]};
    default                                         {[[0, 8],    [0, 0]]};
};

_offset