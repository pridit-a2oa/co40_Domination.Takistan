#define THIS_MODULE vehicle_wreck
#include "x_macros.sqf"
private ["_vehicle", "_chance"];

PARAMS_1(_vehicle);

_chance = if (_vehicle isKindOf "LandVehicle") then {
    GVAR(vehicle_wreck_chance_land)
} else {
    GVAR(vehicle_wreck_chance_air)
};

if (_chance > floor (random 100)) exitWith {
    _vehicle setVariable [
        QGVAR(handler),
        _vehicle addMPEventHandler ["MPKilled", {
            private ["_vehicle", "_target"];

            PARAMS_1(_vehicle);

            _target = _vehicle getVariable QGVAR(target);

            if (!isNil QMODULE(mission_main) && {isServer && {!isNil "_target" && {typeOf _vehicle in (_target getVariable QGVAR(wrecks))}}}) exitWith {
                __addDead(_vehicle);
            };

            if (isServer) then {
                _vehicle setVariable [QGVAR(wreckable), true, true];

                if (!isNil QMODULE(mission_main) && {!isNil "_target" && {!(typeOf _vehicle in (_target getVariable QGVAR(wrecks)))}}) then {
                    _target setVariable [QGVAR(wrecks), (_target getVariable QGVAR(wrecks)) + [typeOf _vehicle]];
                };
            };

            if (hasInterface) then {
                _vehicle spawn {
                    sleep GVAR(vehicle_wreck_time_announce);

                    if !(isNil QMODULE(vehicle_marker)) then {
                        [_this] call FUNC(vehicle_marker,create);
                    };
                };
            };
        }
    ]];

    _vehicle addEventHandler ["getin", {
        private ["_vehicle", "_handler"];

        PARAMS_1(_vehicle);

        _handler = _vehicle getVariable QGVAR(handler);

        if !(isNil "_handler") then {
            _vehicle setVariable [QGVAR(handler), nil];

            _vehicle removeMPEventHandler ["MPKilled", _handler];

            __addDead(_vehicle);
        };
    }];
};

__addDead(_vehicle);