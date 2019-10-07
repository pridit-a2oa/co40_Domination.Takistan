#include "x_macros.sqf"
private ["_vehicle", "_offset"];

PARAMS_1(_vehicle);

_offset = switch (typeOf _vehicle) do {
    case "A10_US_EP1":          {-0.8};
    case "BAF_Merlin_HC3_D":    {2.5};
    case "C130J_US_EP1":        {5};
    case "CH_47F_EP1":          {2.5};
    case "F35B":                {0.2};
    case "L39_TK_EP1":          {1.7};
    case "Mi17_TK_EP1":         {2};
    case "Mi24_D_TK_EP1":       {1.7};
    case "MV22":                {2};
    case "Su25_TK_EP1":         {0.8};
    case "UH1H_TK_EP1":         {1.7};
    case "UH60M_EP1":           {1.7};
    case "UH60M_MEV_EP1":       {1.7};
    default                     {1};
};

_offset