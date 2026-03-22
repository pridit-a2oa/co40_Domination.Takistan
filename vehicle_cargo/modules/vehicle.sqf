/**
 * Vehicle Cargo Module - Vehicle Submodule
 */

#define THIS_MODULE vehicle_cargo
#include "x_macros.sqf"
private ["_vehicle"];

PARAMS_1(_vehicle);

if !(typeOf _vehicle in ([0, GVAR(vehicle_cargo_types)] call FUNC(common,arrayValues))) exitWith {};

if (isServer) then {
    _vehicle setVariable [QGVAR(cargo), [], true];

    _vehicle addEventHandler ["Killed", {
        private ["_vehicle", "_cargo"];

        PARAMS_1(_vehicle);

        _vehicle spawn {
            {
                private ["_cargo", "_entity", "_placeholder"];

                _cargo = _this getVariable QGVAR(cargo);

                _entity = (_cargo select _forEachIndex) select 0;
                _placeholder = (_cargo select _forEachIndex) select 1;

                [true, "enableSimulation", [_entity, true]] call FUNC(network,mp);

                deleteVehicle _placeholder;

                [
                    _this,
                    position _this,
                    _entity,
                    [
                        [
                            round (random 20) -20,
                            round (random 20) -20,
                            if ((position _this) select 2 < 1) then {-1} else {-5}
                        ],
                        random 360
                    ]
                ] call FUNC(common,paradrop);

                if (alive _entity) then {
                    [_entity, "lock", false] call FUNC(network,mp);
                };

                [true, "hideObject", [_entity, false]] call FUNC(network,mp);

                _entity setVariable [QGVAR(hidden), false, true];

                sleep 1.5;
            } forEach (_this getVariable QGVAR(cargo));
        };
    }];
};

if (hasInterface) then {
    {
        (_x select 0) hideObject true;

        [_vehicle, _x select 0] call FUNC(THIS_MODULE,action);
    } forEach (_vehicle getVariable QGVAR(cargo));
};