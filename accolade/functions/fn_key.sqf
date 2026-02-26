#define THIS_MODULE accolade
#include "x_macros.sqf"
private ["_id"];

PARAMS_1(_id);

format [
    "d_%1_%2",
    QUOTE(THIS_MODULE),
    _id
]