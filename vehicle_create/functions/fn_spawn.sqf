#define THIS_MODULE vehicle_create
#include "x_macros.sqf"
private ["_vehicle", "_type", "_offset", "_occupied", "_deployer"];

PARAMS_2(_vehicle, _type);

_offset = [_type] call FUNC(vehicle,offsetCreate);
_occupied = (_vehicle modelToWorld _offset) nearEntities [["Air", "LandVehicle"], 7];

if (count _occupied > 0) then {
    _deployer = _occupied find _vehicle;

    if (_deployer != -1) then {
        _occupied = [_occupied, _deployer] call FUNC(common,deleteAt);
    };
};

if (count _occupied > 0) exitWith {
    if (hasInterface) then {
        hint "Creation point is already occupied by a vehicle";
    };

    false
};

if (hasInterface) then {
    if !(isServer) then {
        [gameLogic, "execVM", [_this, __function(spawn)]] call FUNC(network,mp);
    };
};

if (isServer) then {
    private ["_position", "_new"];

    _position = _vehicle modelToWorld _offset;

    _new = createVehicle [_type, [_position select 0, _position select 1, 0], [], 0, "NONE"];
    _new setDir (if (_new isKindOf "LandVehicle") then {direction _vehicle} else {direction _vehicle - 180});
    _new setVectorUp (vectorUp _vehicle);
    _new setPos [_position select 0, _position select 1, 0];
    _new engineOn true;

    if (!isNil QMODULE(vehicle_abandon)) then {
        _new setVariable [QGVAR(abandon), true, true];
    };

    if (!isNil QMODULE(vehicle_respawn)) then {
        _new setVariable [QGVAR(respawnable), false, true];
    };

    [true, "say3D", [_new, QGVAR(sound_build), 20]] call FUNC(network,mp);
    [true, "execVM", [[_new], FUNCTION(vehicle,handle)]] call FUNC(network,mp);

    __addDead(_new);

    [true, "reveal", _new] call FUNC(network,mp);
};