#define THIS_MODULE item
#include "x_macros.sqf"

if (!isNil QMODULE(item_money) && {!([GVAR(item_money_type), true] call FUNC(THIS_MODULE,consume))}) exitWith {false};

true