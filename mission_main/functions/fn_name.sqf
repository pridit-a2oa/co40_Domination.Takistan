#include "x_macros.sqf"
private ["_name"];

PARAMS_1(_name);

_name = switch (_name) do {
    case "Chak Chak": {"ChakChak"};
    case "Feruz Abad": {"FeeruzAbad"};
    case "Loy Manara": {"LoyManara"};
    case "Mulladost": {"Mulladoost"};
    case "Sakhe": {"Sakhee"};
    case "Sultansafe": {"Sultansafee"};
    case default {_name};
};

_name