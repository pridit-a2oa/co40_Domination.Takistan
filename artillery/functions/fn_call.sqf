#include "x_macros.sqf"

if (!isNil QMODULE(crossroad)) then {
    [screenToWorld [0.5, 0.5], format ["artillery strike, %1 salvo(es)", player getVariable QGVAR(perkArtillerySalvoes)]] call FUNC(crossroad,request);
};