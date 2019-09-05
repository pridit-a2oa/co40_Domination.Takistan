#define THIS_MODULE vehicle_wreck
#include "x_macros.sqf"
private ["_vehicle", "_chance"];

PARAMS_1(_vehicle);

_chance = if (_vehicle isKindOf "LandVehicle") then {
    GVAR(vehicle_wreck_chance_land)
} else {
    GVAR(vehicle_wreck_chance_air)
};

if (_chance > random 100) then {
    _vehicle setVariable [QGVAR(wreckable), true, true];

    if (!isNil QMODULE(crossroad)) then {
        _vehicle addMPEventHandler ["MPKilled", {
            private ["_vehicle"];
            
            PARAMS_1(_vehicle);
            
            _vehicle spawn {
                sleep GVAR(vehicle_wreck_time_announce);
                
                if (!isNil QMODULE(vehicle_marker)) then {
                    [_this] call FUNC(vehicle_marker,create);
                };
                
                GVAR(crossroad) kbTell [GVAR(crossroad2), "vehicle_wreck", "Detected", ["1", {}, [typeOf _this] call FUNC(vehicle,name), []], true];
            };
        }];
    };
} else {
    __addDead(_vehicle);
};