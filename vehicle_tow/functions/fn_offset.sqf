#include "x_macros.sqf"
private ["_vehicle", "_offset"];

PARAMS_1(_vehicle);

_offset = switch (typeOf _vehicle) do {
    case "A10_US_EP1":             {[[0, 8],    [0, -1]]};
    case "BAF_Merlin_HC3_D":       {[[0, 10],   [0, 0]]};
    case "C130J_US_EP1":           {[[0, 15],   [0, -5]]};
    case "CH_47F_EP1":             {[[0, 10],   [0, 0]]};
    case "MH6J_EP1":               {[[0, 5],    [0, 0]]};
    case "Mi17_base":              {[[0, 8],    [0, 0]]};
    case "Mi24_D_TK_EP1":          {[[0, 9],    [0, -1]]};
    case "MV22":                   {[[0, 12],   [0, 0]]};
    case "MQ9PredatorB_US_EP1":    {[[0, 5.5],  [0, -1]]};
    default                        {[[0, 8],    [0, 0]]};
};

_offset