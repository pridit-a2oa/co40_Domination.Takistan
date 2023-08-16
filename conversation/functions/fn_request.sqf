#define THIS_MODULE conversation
#include "x_macros.sqf"
private ["_unit", "_position", "_type"];

PARAMS_3(_unit, _position, _type);

[_unit, mapGridPosition _position, _type] spawn {
    private ["_unit", "_position", "_type"];
    
    PARAMS_3(_unit, _position, _type);
    
    [
        [_unit, GVAR(crossroad)],
        ["HQ", "Request"],
        [
            ["Payload", {}, "", [[_type] call FUNC(THIS_MODULE,type)]],
            ["Type", {}, _type, []],
            ["Grid", {}, _position, _position call FUNC(common,numbersToWords)]
        ],
        true
    ] call FUNC(THIS_MODULE,radio);
    
    waitUntil {sleep 0.1; _unit kbWasSaid [GVAR(crossroad), "HQ", "Request", 1]};

    sleep 1;

    [
        [GVAR(crossroad), _unit],
        ["HQ", "Acknowledge"],
        [
            ["Type", {}, _type, []]
        ]
    ] call FUNC(THIS_MODULE,radio);
};