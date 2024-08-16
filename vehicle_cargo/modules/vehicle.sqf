/**
 * Vehicle Cargo Module - Vehicle Submodule
 */

#define THIS_MODULE vehicle_cargo
#include "x_macros.sqf"
private ["_vehicle", "_loaded", "_actions", "_load", "_action"];

PARAMS_1(_vehicle);

if !([GVAR(vehicle_cargo_type_aircraft), typeOf _vehicle] call BIS_fnc_areEqual) exitWith {};

if (isServer) then {
    _loaded = [];
    _actions = [];

    for "_i" from 1 to GVAR(vehicle_cargo_amount_max) do {
        _loaded set [(_i - 1), [nil]];
        _actions set [(_i - 1), false];
    };

    _vehicle setVariable [QGVAR(loaded), _loaded, true];
    _vehicle setVariable [QGVAR(actions), _actions, true];

    _vehicle addEventHandler ["Killed", {
        private ["_aircraft"];

        PARAMS_1(_aircraft);

        _loaded = _aircraft getVariable QGVAR(loaded);

        [_aircraft, _loaded] spawn {
            private ["_aircraft", "_loaded"];

            PARAMS_2(_aircraft, _loaded);

            {
                if (!isNil {_x select 0}) then {
                    _height = ((position _aircraft) select 2);

                    _eject = [
                        [round (random 20) -20, round (random 20) -20, if (_height < 1) then {-1} else {-5}],
                        random 360
                    ];

                    _load = [_aircraft, position _aircraft, _loaded select _forEachIndex, _eject] call FUNC(common,paradrop);
                    _load setDamage (random 0.7);
                    _load setFuel (random 0.5);

                    sleep 1.5;
                };
            } forEach _loaded;
        };
    }];
};

if (hasInterface) then {
    waitUntil {sleep 2; !isNil {_vehicle getVariable QGVAR(loaded)}};

    while {alive _vehicle} do {
        _loaded = _vehicle getVariable QGVAR(loaded);
        _actions = _vehicle getVariable QGVAR(actions);

        {
            if (!isNil {_x select 0}) then {
                _load = _loaded select _forEachIndex;
                _action = _actions select _forEachIndex;

                if (!_action) then {
                    _actions set [
                        _forEachIndex,
                        true
                    ];

                    [
                        nil,
                        _vehicle,
                        "per",
                        rAddAction,
                        format ["Unload %1", [_load select 0] call FUNC(vehicle,name)] call FUNC(common,RedText),
                        __function(unload),
                        _load,
                        10,
                        false,
                        true,
                        "",
                        "[player, driver _target] call BIS_fnc_areEqual && {[_target animationPhase ""ramp_top"", 1] call BIS_fnc_areEqual}",
                        format ["vehicleLoad%1", _forEachIndex]
                    ] call RE;

                    _vehicle setVariable [QGVAR(actions), _actions, true];
                };
            };
        } forEach _loaded;

        sleep 5;
    };
};