#include "x_macros.sqf"
private ["_unit", "_position"];
PARAMS_2(_unit, _position);

if (hasInterface) then {
    X_JIPH setVariable [QGVAR(artillery), true, true];
    
    if (!isServer) then {
        artillery = _this;
        publicVariableServer "artillery";
    };
};

if (isServer) then {
    if (!isNil QMODULE(crossroad)) then {
        [_unit, _position, format ["artillery strike, %1 salvo(es)", player getVariable QGVAR(artillery_salvoes)]] call FUNC(crossroad,request);
    };
    
    GVAR(artillery_smoke) createVehicle _position;
};