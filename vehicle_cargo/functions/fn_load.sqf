#define THIS_MODULE vehicle_cargo
#include "x_macros.sqf"
private ["_vehicle", "_type", "_entity"];

PARAMS_2(_vehicle, _type);

_entity = [_this, 2, objNull] call FUNC(common,param);

if !([_vehicle] call FUNC(THIS_MODULE,valid)) exitWith {false};
if (isNil {_vehicle getVariable QGVAR(cargo)}) exitWith {false};

if (hasInterface) then {
    private ["_name", "_checks"];

    _entity = [_vehicle, _type] call FUNC(THIS_MODULE,entity);

    if ([_entity, objNull] call BIS_fnc_areEqual) exitWith {};

    _name = [typeOf _entity] call FUNC(vehicle,name);
    _checks = [
        [
            [_name, "unloaded"],
            player getVariable QGVAR(vehicle_cargo_cooldown)
        ] call FUNC(helper,timeExceeded)
    ];

    {
        if ([typeName _x, "STRING"] call BIS_fnc_areEqual) exitWith {
            [_x] call FUNC(client,hint);
        };
    } forEach _checks;

    if ({[_x, true] call BIS_fnc_areEqual} count _checks < count _checks) exitWith {
        _entity = objNull;
    };

    player setVariable [QGVAR(vehicle_cargo_cooldown), time + GVAR(vehicle_cargo_cooldown)];

    _this set [2, _entity];

    if !(isServer) then {
        [gameLogic, "execVM", [_this, __function(load)]] call FUNC(network,mp);
    };
};

if !([_entity] call FUNC(THIS_MODULE,valid)) exitWith {false};
if (_entity in ([0, _vehicle getVariable QGVAR(cargo)] call FUNC(common,arrayValues))) exitWith {false};

if (isServer || {!([_entity, objNull] call BIS_fnc_areEqual)}) then {
    [_entity, "lock", true] call FUNC(network,mp);

    _entity setVariable [QGVAR(hidden), true, true];

    [_vehicle, _entity] spawn {
        private ["_vehicle", "_entity"];

        PARAMS_2(_vehicle, _entity);

        if !([_vehicle animationPhase "ramp_bottom", 1] call BIS_fnc_areEqual) then {
            _vehicle animate ["ramp_top", 1];
            _vehicle animate ["ramp_bottom", 1];

            sleep 3;
        };

        if (alive _vehicle && {[_vehicle] call FUNC(THIS_MODULE,valid)}) exitWith {
            private ["_placeholder"];

            [true, "hideObject", [_entity, true]] call FUNC(network,mp);

            _placeholder = createVehicle [
                typeOf _entity,
                [(position _vehicle) select 0, (position _vehicle) select 1, -50],
                [],
                0,
                "CAN_COLLIDE"
            ];

            _placeholder setVariable [QGVAR(handled), true, true];

            _vehicle setVariable [
                QGVAR(cargo),
                (_vehicle getVariable QGVAR(cargo)) + [[_entity, _placeholder]],
                true
            ];

            {
                _x attachTo [_vehicle, [_x] call FUNC(common,attachPoint)];

                [true, "enableSimulation", [_x, false]] call FUNC(network,mp);
            } forEach [
                _entity,
                _placeholder
            ];

            sleep 1;

            {
                if (isPlayer _x) then {
                    moveOut _x;

                    [_x, "moveInCargo", _vehicle] call FUNC(network,mp);
                };
            } forEach crew _entity;

            if (isEngineOn _entity) then {
                [_entity, "engineOn", false] call FUNC(network,mp);
            };

            [true, "execVM", [[_vehicle, _entity, true], __function(action)]] call FUNC(network,mp);
        };

        if !(alive _entity) exitWith {};

        [_entity, "lock", false] call FUNC(network,mp);

        _entity setVariable [QGVAR(hidden), false, true];
    };
};

true