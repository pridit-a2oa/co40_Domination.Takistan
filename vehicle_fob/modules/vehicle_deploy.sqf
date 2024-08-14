/**
 * Vehicle FOB Module - Vehicle Deploy Submodule
 */

#define THIS_MODULE vehicle_fob
#include "x_macros.sqf"
private ["_vehicle", "_state"];

PARAMS_2(_vehicle, _state);

switch (_state) do {
    case true: {
        _vehicle setVariable [QGVAR(cleanup), []];

        _vehicle spawn {
            private ["_heli", "_objects", "_group"];

            {
                _this animate [_x, 1]
            } forEach [
                "door_1",
                "door_2_1",
                "door_2_2",
                "ramp_top",
                "ramp_bottom"
            ];

            sleep 3;

            [_this] call FUNC(vehicle,attach);

            if (!isNil QMODULE(ammobox)) then {
                private ["_ammobox", "_pitchBank"];

                _ammobox = [_this] __submodulePP(ammobox);

                _pitchBank = _this call BIS_fnc_getPitchBank;

                [_ammobox, (_pitchBank select 0) + 10, _pitchBank select 1] call BIS_fnc_setPitchBank;

                _this setVariable [QGVAR(cleanup), (_this getVariable QGVAR(cleanup)) + [_ammobox]];
            };

            _heli = createVehicle ["HeliH", _this modelToWorld [-18, 15, 0], [], 0, "CAN_COLLIDE"];
            _heli setDir ((getDir _this) - 180);
            _heli setPos (_this modelToWorld [-18, 15, 0]);

            _objects = [
                _this modelToWorld [-7.2, 2, 0],
                (direction _this) - 90,
                "SmallBase_EP1",
                [
                    ["FoldChair"],
                    ["FoldTable"],
                    ["Land_CamoNetVar_NATO_EP1", "MtvrRepair_DES_EP1"],
                    ["Paleta2", "FlagCarrierUSA_EP1"]
                ]
            ] call FUNC(server,objectMapper);

            _group = [
                position _this,
                west,
                (configFile >> "CfgGroups" >> "West" >> "BIS_US" >> "Infantry" >> "US_TeamSupport")
            ] call FUNC(server,spawnGroup);

            if (!isNil QMODULE(unit)) then {
                [_group, position _this] call FUNC(unit,defend);
            };

            _this setVariable [QGVAR(cleanup), (_this getVariable QGVAR(cleanup)) + [_heli] + _objects + (units _group)];
        };
    };

    case false: {
        [_vehicle] call FUNC(vehicle_deploy,cleanup);
        [_vehicle] call FUNC(vehicle,detach);

        {
            _vehicle animate [_x, 0]
        } forEach [
            "door_1",
            "door_2_1",
            "door_2_2",
            "ramp_top",
            "ramp_bottom"
        ];
    };
};