#include "x_macros.sqf"
private ["_type", "_original", "_cooldown"];

PARAMS_2(_type, _original);

_cooldown = [_type] call FUNC(airdrop,cooldown);

if (_original) then {
    player setVariable [
        QGVAR(airdrop_cooldown),
        (player getVariable QGVAR(airdrop_cooldown)) max ((time + _cooldown) - (diag_tickTime - GVAR(time)))
    ];
};

player setVariable [QGVAR(airdrop_types), (player getVariable QGVAR(airdrop_types)) + [
    [
        format [
            "%1%2",
            if !(isNil QMODULE(perk)) then {"(Perk) "} else {""},
            [_type] call FUNC(vehicle,name)
        ],
        _type
    ]
]];

if !(isNil QMODULE(setting)) then {
    ["airdrop_type", _original] call FUNC(setting,update);
};