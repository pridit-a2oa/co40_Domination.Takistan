#include "x_macros.sqf"
private ["_string"];

PARAMS_1(_string);

hint parseText format [
    "<br /><t size='1.1'><t color='#c54a30' underline='1'>PROHIBITED</t><br /><br />%1</t><br /><br />",
    _string
]