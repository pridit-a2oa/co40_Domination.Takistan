/**
 * Accolade Module (Handler)
 */

#define THIS_MODULE accolade
#include "x_macros.sqf"

if (isServer) then {
    private ["_building"];

    _building = (nearestObjects [markerPos QGVAR(accolade), [], 10]) select 0;

    {
        private ["_object"];

        _object = createVehicle [_x select 0, _x select 1, [], 0, "CAN_COLLIDE"];
        _object setDir ((getDir _building) - (_x select 2));
        _object setPosATL (_x select 1);
        _object addEventHandler ["HandleDamage", {0}];
    } forEach [
        [
            "Land_A_Office01_EP1",
            _building modelToWorld [0, -0.5, -5.4],
            180
        ],
        [
            "Land_Misc_Scaffolding",
            _building modelToWorld [-5.5, -9.4, -5.6],
            90
        ]
    ];

    _building setDamage 1;

    deleteVehicle _building;

    X_JIPH setVariable [QGVAR(accolade), true, true];
};

if (hasInterface) then {
    waitUntil {sleep 0.1; !isNil {X_JIPH getVariable QGVAR(accolade)}};

    0 spawn {
        waitUntil {
            private ["_types"];

            sleep 1;

            _types = nearestObjects [markerPos QGVAR(accolade), [], 15];

            {
                if ([typeOf _x, "Land_Mil_House_ruins_EP1"] call BIS_fnc_areEqual) then {
                    private ["_ruin"];

                    _ruin = _types select _forEachIndex;
                    _ruin setDamage 1;

                    deleteVehicle _ruin;
                };
            } forEach _types;

            [{[typeOf _x, "Land_Mil_House_ruins_EP1"] call BIS_fnc_areEqual} count _types, 0] call BIS_fnc_areEqual
        };
    };
};