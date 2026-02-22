#include "x_macros.sqf"
private ["_map"];

PARAMS_1(_map);

if ([count _this, 2] call BIS_fnc_areEqual) exitWith {
    private ["_type", "_params", "_position"];

    PARAMS_2(_type, _params);

    _position = ctrlPosition (_params select 0);

    switch (_type) do {
        case "Holding";
        case "Moving": {
            (_params select 0) ctrlMapCursor [
                "",
                if !(false in [
                    (_params select 1) > (_position select 0),
                    (_params select 1) < ((_position select 2) + (_position select 0)),
                    (_params select 2) > (_position select 1),
                    (_params select 2) < ((_position select 1) + (_position select 3))
                ]) then {
                    if (_params select 3) then {
                        if (GVAR(RMB)) then {"Scroll"} else {"Track"}
                    } else {
                        "Arrow"
                    }
                } else {
                    "Arrow"
                }
            ];
        };

        case "ButtonUp";
        case "ButtonDown": {
            if !([_params select 1, 1] call BIS_fnc_areEqual) exitWith {};

            GVAR(RMB) = [_type, "ButtonDown"] call BIS_fnc_areEqual;
        };
    };
};

GVAR(RMB) = false;

{
    _map ctrlAddEventHandler [
        format ["Mouse%1", _x],
        format ["['%1', _this] call d_fnc_client_cursorMap", _x]
    ];
} forEach [
    "Moving",
    "Holding",
    "ButtonDown",
    "ButtonUp"
];