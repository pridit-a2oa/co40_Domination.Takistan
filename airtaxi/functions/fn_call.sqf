#include "x_macros.sqf"

if (!isNil QMODULE(crossroad)) then {
    [screenToWorld [0.5, 0.5], "air taxi"] call FUNC(crossroad,request);
};