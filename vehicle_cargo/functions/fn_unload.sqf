#define THIS_MODULE vehicle_cargo
#include "x_macros.sqf"
private ["_vehicle", "_index", "_checks"];

PARAMS_1(_vehicle);

_index = [_this, 3, [_this, 1, -1] call FUNC(common,param)] call FUNC(common,param);

if (hasInterface) then {
    private ["_entity", "_name"];

    _entity = ((_vehicle getVariable QGVAR(cargo)) select _index) select 0;

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

    if ({[_x, true] call BIS_fnc_areEqual} count _checks < count _checks) exitWith {};

    player setVariable [QGVAR(vehicle_cargo_cooldown), time + GVAR(vehicle_cargo_cooldown)];

    [true, "spawn", [[_vehicle, _entity], {
        private ["_vehicle", "_entity", "_action"];

        PARAMS_2(_vehicle, _entity);

        if (isDedicated) exitWith {};

        _action = +(_entity getVariable QGVAR(action));

        if (isNil "_action" || {[_entity getVariable QGVAR(action), -1] call BIS_fnc_areEqual}) exitWith {};

        _entity setVariable [QGVAR(action), -1];

        _vehicle removeAction _action;
    }]] call FUNC(network,mp);

    if !(isServer) then {
        [gameLogic, "execVM", [_this, __function(unload)]] call FUNC(network,mp);
    };
};

if (isServer && {!hasInterface || {isServer && {hasInterface && {[{[_x, true] call BIS_fnc_areEqual} count _checks, count _checks] call BIS_fnc_areEqual}}}}) then {
    private ["_cargo", "_entity"];

    _cargo = +(_vehicle getVariable QGVAR(cargo));

    _vehicle setVariable [QGVAR(cargo), [_cargo, _index] call BIS_fnc_removeIndex, true];

    _entity = _cargo select _index;

    if (isNil "_entity" || {[count _entity, 0] call BIS_fnc_areEqual}) exitWith {};

    [true, "enableSimulation", [_entity select 0, true]] call FUNC(network,mp);

    deleteVehicle (_entity select 1);

    [
        _vehicle,
        position _vehicle,
        _entity select 0
    ] call FUNC(common,paradrop);

    [_entity select 0, "lock", false] call FUNC(network,mp);

    [true, "hideObject", [_entity select 0, false]] call FUNC(network,mp);

    (_entity select 0) setVariable [QGVAR(hidden), false, true];
};

true