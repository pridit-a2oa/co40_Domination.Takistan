/**
 * Mission Main Module (Handler)
 */

#define THIS_MODULE mission_main
#include "x_macros.sqf"

if (isServer) then {
    private ["_locations"];

    _locations = [
        ["NameCityCapital", "NameCity", "NameVillage"],
        [
            markerPos QGVAR(map_zone),
            7500
        ]
    ] call BIS_fnc_locations;

    {
        private ["_base"];

        _base = _x distance (markerPos QGVAR(base_south)) > GVAR(mission_main_distance_base);

        if (_base && {!((_x getVariable "name") in GVAR(mission_main_type_exceptions))}) then {
            GVAR(mission_main_targets) = GVAR(mission_main_targets) + [_x];
        };

        _x setVariable [QGVAR(name), _x getVariable "name", true];
    } forEach _locations;

    GVAR(mission_main_targets_maximum) = round (count GVAR(mission_main_targets) / GVAR(mission_main_location_divisor));

    0 spawn {
        for "_i" from 1 to GVAR(mission_main_amount_targets) do {
            sleep GVAR(mission_main_time_delay);

            [GVAR(mission_main_targets) call BIS_fnc_selectRandom] spawn FUNC(THIS_MODULE,create);
        };
    };
};

if (hasInterface) then {
    {
        {
            _x addEventHandler ["HandleDamage", {0}];
            _x enableSimulation false;
        } forEach (nearestObjects [position _x, ["Land_tent_east"], GVAR(mission_main_radius_zone)]);

        {
            [
                _x,
                "Capture" call FUNC(common,RedText),
                [1, GVAR(3d_distance_visible)],
                false,
                true
            ] spawn FUNC(3d,create);
        } forEach (_x getVariable QGVAR(camps));
    } forEach (X_JIP getVariable QGVAR(targets));

    0 spawn {
        {
            {
                {
                    [_x] call FUNC(THIS_MODULE,protect);
                } forEach (allMissionObjects _x);

                sleep 0.5;
            } forEach _x;
        } forEach [
            [GVAR(mission_main_type_radio)],
            [1, [1, GVAR(mission_main_type_optional)] call FUNC(common,arrayValues)] call FUNC(common,arrayValues)
        ];
    };
};