#include "x_macros.sqf"
private ["_position", "_type", "_grid"];
PARAMS_2(_position,_type);

[(mapGridPosition _position), _type] spawn {
    _grid = (_this select 0) call FUNC(client,numbersToWords);
    
    player kbTell [GVAR(crossroad), "HQ", "CrossroadRequest", ["1", {}, _this select 1, []], ["2", {}, _this select 0, _grid], true];

    sleep 5;

    GVAR(crossroad) kbTell [player, "HQ", "CrossroadAcknowledged", ["1", {}, _this select 1, []], true];
};