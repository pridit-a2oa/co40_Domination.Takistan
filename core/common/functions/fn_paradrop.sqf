#include "x_macros.sqf"
private ["_vehicle", "_target", "_cargo", "_drop"];

PARAMS_4(_vehicle, _target, _cargo, _drop);

_drop = [_this, 3, ""] call FUNC(common,param);

if ([typeName _cargo, "STRING"] call BIS_fnc_areEqual) then {
    _cargo = createVehicle [_cargo, [0, 0, 0], [], 0, "CAN_COLLIDE"];

    _cargo attachTo [_vehicle, [_cargo] call FUNC(common,attachPoint)];

    _this set [2, _cargo];
};

if !([typeName _drop, "ARRAY"] call BIS_fnc_areEqual) then {
    _this set [3, [[0, -15, -5], direction _vehicle]];
};

_this spawn {
    private ["_vehicle", "_target", "_cargo", "_drop", "_position"];

    PARAMS_4(_vehicle, _target, _cargo, _drop);

    if (alive _vehicle && {!locked _vehicle && {!([_vehicle animationPhase "ramp_bottom", 1] call BIS_fnc_areEqual)}}) then {
        _vehicle animate ["ramp_top", 1];
        _vehicle animate ["ramp_bottom", 1];

        sleep 3;
    };

    if !([direction _vehicle, _drop select 1] call BIS_fnc_areEqual) then {
        detach _cargo;
    };

    _position = _vehicle modelToWorld (_drop select 0);

    _cargo setDir (_drop select 1);
    _cargo setPos _position;
    _cargo setVectorUp (vectorUp _vehicle);

    if ([direction _vehicle, _drop select 1] call BIS_fnc_areEqual) then {
        detach _cargo;
    };

    if (!isNil QMODULE(vehicle) && {!(_cargo isKindOf "ReammoBox")}) then {
        [true, "execVM", [[_cargo], FUNCTION(vehicle,handle)]] call FUNC(network,mp);
    };

    [true, "reveal", _cargo] call FUNC(network,mp);

    if ((position _vehicle) select 2 > 100) then {
        private ["_parachute"];

        if (alive _vehicle && {!locked _vehicle}) then {
            _vehicle animate ["ramp_top", 0];
            _vehicle animate ["ramp_bottom", 0];
        };

        _parachute = createVehicle ["ParachuteMediumWest_EP1", _position, [], 0, "NONE"];
        _parachute setPos _position;

        _cargo attachTo [_parachute, [0, 0, 1]];

        [_parachute, _cargo, _target, 0] call FUNC(common,mandoChute);

        waitUntil {sleep 0.1; (position _cargo) select 2 < 3};

        if (!isNil QMODULE(ammobox) && {[typeOf _cargo, ([faction _cargo] call FUNC(ammobox,type)) select 1] call BIS_fnc_areEqual}) then {
            private ["_position", "_direction"];

            _position = [(position _cargo) select 0, (position _cargo) select 1, 0];
            _direction = direction _cargo;

            deleteVehicle _cargo;

            [
                "BIS_US",
                _position,
                _direction,
                false
            ] call FUNC(ammobox,create);
        };
    } else {
        _position set [2, 0];

        _cargo setPos _position;
        _cargo setVectorUp surfaceNormal _position;
    };
};

_cargo