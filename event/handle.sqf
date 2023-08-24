#define THIS_MODULE event
#include "x_macros.sqf"

if (isServer) then {
    0 spawn {
        {
            private ["_amount", "_capacity"];

            _amount = call compile format ["d_%1_%2_amount", QUOTE(THIS_MODULE), _x];
            _capacity = call compile format ["d_%1_%2_positions", QUOTE(THIS_MODULE), _x];

            for "_i" from 1 to (_amount min (count _capacity)) do {
                sleep 3;

                [_x] call FUNC(THIS_MODULE,create);
            };
        } forEach GVAR(event_types);
    };
};