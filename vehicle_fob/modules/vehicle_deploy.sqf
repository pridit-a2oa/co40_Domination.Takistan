/**
 * Vehicle FOB Module - Vehicle Deploy Submodule
 */

#include "x_macros.sqf"
private ["_vehicle", "_state"];

PARAMS_2(_vehicle, _state);

switch (_state) do {
    case true: {
        _vehicle setVariable [QGVAR(cleanup), []];
        
        _vehicle spawn {
            _this animate ["ramp_top", 1];
            _this animate ["ramp_bottom", 1];

            sleep 3;

            if (!isNil QMODULE(ammobox)) then {
                _box = [
                    _this modelToWorld [0, -5.5, -4.95],
                    direction _this,
                    false
                ] call FUNC(ammobox,create);

                _box setVectorUp [-0.12, -0.12, 1];

                [_box] call FUNC(vehicle_ammobox,replenish);
                
                _this setVariable [QGVAR(cleanup), (_this getVariable QGVAR(cleanup)) + [_box]];
            };
            
            [
                [west, _this],
                _this modelToWorld [-7.2, 2, 0],
                (direction _this) - 90,
                "SmallBase_EP1",
                0,
                [
                    ["Paleta2", "FlagCarrierUSA_EP1"],
                    ["USBasicWeapons_EP1", "US_WarfareBVehicleServicePoint_Base_EP1"]
                ]
            ] spawn FUNC(server,objectMapper);
        };
    };

    case false: {
        _vehicle spawn {
            {
                if (_x isKindOf "CAManBase") then {
                    _x setDamage 1;
                };

                deleteVehicle _x;

                sleep 0.2;
            } forEach (_this getVariable QGVAR(cleanup));

            waitUntil {{!isNull _x} count (_this getVariable QGVAR(cleanup)) < 1};

            _this animate ["ramp_top", 0];
            _this animate ["ramp_bottom", 0];
        };
    };
};