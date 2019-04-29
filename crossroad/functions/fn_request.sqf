#include "x_macros.sqf"
private ["_unit", "_position", "_type", "_grid"];

PARAMS_3(_unit, _position,_type);

[_unit, (mapGridPosition _position), _type] spawn {
    _grid = (_this select 1) call FUNC(common,numbersToWords);
    
    [(_this select 0), GVAR(crossroad), "HQ", "CrossroadRequest", ["1", {}, _this select 2, []], ["2", {}, _this select 1, _grid], true] call FUNC(network,kbTell);

    sleep 5;
    
    GVAR(crossroad) kbTell [(_this select 0), "HQ", "CrossroadAcknowledged", ["1", {}, _this select 2, []], true];
};