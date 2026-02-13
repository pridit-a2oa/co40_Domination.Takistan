#include "x_macros.sqf"

while {true} do {
    {
        if ([count units _x, 0] call BIS_fnc_areEqual) then {
            X_JIP setVariable [QGVAR(groups), (X_JIP getVariable QGVAR(groups)) - [_x], true];

            deleteGroup _x;
        };
    } forEach (X_JIP getVariable QGVAR(groups));

    sleep 10;
};