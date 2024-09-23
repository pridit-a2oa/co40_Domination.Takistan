/**
 * Vehicle Respawn Module - Vehicle Submodule
 */

#define THIS_MODULE vehicle_respawn
#include "x_macros.sqf"
private ["_vehicle"];

PARAMS_1(_vehicle);

if ((markerPos QGVAR(base_south)) distance (_vehicle getVariable QGVAR(position)) >= GVAR(vehicle_respawn_distance_base)) exitWith {};

_vehicle setVectorUp (surfaceNormal (position _vehicle));

if !(true in [_vehicle isKindOf "Air", _vehicle isKindOf "Car"]) exitWith {};

while {!isNull _vehicle} do {
    private ["_position", "_direction", "_threshold", "_expiration", "_respawnable"];

    _position = _vehicle getVariable QGVAR(position);
    _direction = _vehicle getVariable QGVAR(direction);
    _threshold = _vehicle getVariable QGVAR(threshold);
    _expiration = _vehicle getVariable QGVAR(expiration);
    _respawnable = _vehicle getVariable QGVAR(respawnable);

    if (isNil "_position") exitWith {};
    if (!isNil "_respawnable" && {!_respawnable}) exitWith {};

    private ["_empty", "_far"];

    _empty = _vehicle call FUNC(common,empty);
    _far = [{_x distance _vehicle < GVAR(vehicle_respawn_distance_player)} count (call FUNC(common,players)), 0] call BIS_fnc_areEqual;

    if (isNil "_threshold" || {!_empty || {!_far}}) then {
        _threshold = [GVAR(vehicle_respawn_type_vehicles), typeOf _vehicle] call BIS_fnc_findNestedElement;

        if ([_threshold, []] call BIS_fnc_areEqual) exitWith {};

        _threshold = (GVAR(vehicle_respawn_type_vehicles) select (_threshold select 0)) select 0;

        if !(isNil "_threshold") then {
            _vehicle setVariable [QGVAR(threshold), call FUNC(common,time) + _threshold];
        };
    };

    private ["_dead"];

    _dead = !alive _vehicle;

    if (isNil "_expiration" && {_dead}) then {
        _expiration = call FUNC(common,time) + GVAR(vehicle_respawn_time_expiration);

        _vehicle setVariable [QGVAR(expiration), _expiration];
    };

    private ["_moved", "_abandoned", "_destroyed"];

    _moved = _vehicle distance _position > 10;

    _abandoned = [typeName _threshold, "SCALAR"] call BIS_fnc_areEqual && {_empty && {_moved && {_far && {!_dead && {call FUNC(common,time) > _threshold}}}}};
    _destroyed = _empty && {_dead && {call FUNC(common,time) > _expiration}};

    if (_abandoned || {_destroyed}) exitWith {
        private ["_type", "_spawn"];

        _type = typeOf _vehicle;

        if !(isNil QMODULE(vehicle_upgrade)) then {
            _type = [_vehicle] __submodulePP(vehicle_upgrade);
        };

        [_vehicle] call FUNC(vehicle,delete);

        _spawn = createVehicle [_type, _position, [], 0, "NONE"];
        _spawn setDir _direction;
        _spawn setPos _position;

        _spawn setVariable [QGVAR(position), _position, true];
        _spawn setVariable [QGVAR(direction), _direction, true];

        [true, "execVM", [[_spawn], FUNCTION(vehicle,handle)]] call FUNC(network,mp);
    };

    sleep 20;
};