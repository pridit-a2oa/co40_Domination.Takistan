/**
 * Accolade Module (Handler)
 */

#define THIS_MODULE accolade
#include "x_macros.sqf"

if (isServer) then {
    private ["_building", "_office", "_group"];

    _building = (nearestObjects [markerPos QGVAR(accolade), [], 10]) select 0;

    {
        private ["_object"];

        _object = createVehicle [_x select 0, _x select 1, [], 0, "CAN_COLLIDE"];
        _object setDir ((getDir _building) - (_x select 2));
        _object setPosATL (_x select 1);
        _object addEventHandler ["HandleDamage", {0}];

        if ([_x select 0, "Land_A_Office01_EP1"] call BIS_fnc_areEqual) then {
            _office = _object;
        };
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

    sleep 2;

    X_JIP setVariable [QGVAR(accolade), true, true];

    _group = createGroup west;

    {
        private ["_location", "_position", "_entity"];

        _location = call compile format ["d_%1_%2_location", QUOTE(THIS_MODULE), _x select 0];

        _position = _office modelToWorld [0, -abs(_forEachIndex + 1), -5]; // (_location select 0)

        _entity = _group createUnit [_x select 2, [0, 0, 0], [], 0, "CAN_COLLIDE"];
        _entity addEventHandler ["HandleDamage", {0}];

        _entity setDir (_location select 1);
        _entity setPos _position;
        // _entity setVectorUp (surfaceNormal _position);
        _entity disableAI "MOVE";
        _entity setUnitPos "UP";
        // _entity playMoveNow "AidlPpneMstpSnonWnonDnon_SleepB_death";

        removeAllWeapons _entity;

        X_JIP setVariable [
            QGVAR(accolades),
            (X_JIP getVariable QGVAR(accolades)) + [_entity],
            true
        ];
    } forEach GVAR(accolade_types);

    _group allowFleeing 0;
};

if (hasInterface) then {
    waitUntil {
        sleep 0.1;

        !isNil {X_JIP getVariable QGVAR(accolade)}
        && {[{alive _x} count (X_JIP getVariable QGVAR(accolades)), count GVAR(accolade_types)] call BIS_fnc_areEqual}
    };

    {
        if !(isNil QMODULE(menu) && {isNil QMODULE(menu_unit)}) then {
            [_x] __submodulePP(menu);
        };

        _x setRank GVAR(accolade_type_rank);
    } forEach (X_JIP getVariable QGVAR(accolades));

    0 spawn {
        sleep 1;

        waitUntil {
            private ["_types"];

            _types = nearestObjects [markerPos QGVAR(accolade), [], 15];

            {
                if ([typeOf _x, "Land_Mil_House_ruins_EP1"] call BIS_fnc_areEqual) then {
                    private ["_ruin"];

                    _ruin = _types select _forEachIndex;
                    _ruin setDamage 1;

                    deleteVehicle _ruin;

                    sleep 0.1;
                };
            } forEach _types;

            [{[typeOf _x, "Land_Mil_House_ruins_EP1"] call BIS_fnc_areEqual} count _types, 0] call BIS_fnc_areEqual
        };

        while {true} do {
            sleep 1;

            _ruins = [];

            {
                if ([typeOf _x, "Land_Mil_House_ruins_EP1"] call BIS_fnc_areEqual) then {
                    _ruins = _ruins + [_x];
                };
            } forEach nearestObjects [markerPos QGVAR(accolade), [], 15];

            hintSilent format ["Ruins: %1", _ruins];
        };
    };
};