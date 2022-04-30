#define THIS_MODULE crossroad
#include "x_macros.sqf"
private ["_unit", "_position", "_type"];

PARAMS_3(_unit, _position, _type);

[_unit, mapGridPosition _position, _type] spawn {
    private ["_unit", "_position", "_type"];
    
    PARAMS_3(_unit, _position, _type);
    
    _grid = _position call FUNC(common,numbersToWords);
    
    [_unit, "kbTell", [
        GVAR(crossroad),
        "HQ",
        "CrossroadRequest",
        ["Request", {}, "", [[_type] call FUNC(THIS_MODULE,type)]],
        ["Type", {}, _type, []],
        ["Location", {}, _position, _grid],
        true
    ]] call FUNC(network,mp);
    
    sleep 5;
    
    GVAR(crossroad) kbTell [
        _unit,
        "HQ",
        "CrossroadAcknowledged",
        ["Type", {}, _type, []],
        true
    ];
};