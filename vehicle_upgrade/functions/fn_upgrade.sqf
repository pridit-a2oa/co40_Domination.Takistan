#define THIS_MODULE vehicle_upgrade
#include "x_macros.sqf"
private ["_vehicle", "_type", "_name", "_checks"];

PARAMS_2(_vehicle, _type);

_name = [typeOf _vehicle] call FUNC(vehicle,name);
_checks = [
    [
        [format ["%1 upgrade", _name], "performed"],
        markerPos QGVAR(base_south),
        position _vehicle,
        [GVAR(vehicle_upgrade_distance_base), "within", "of base"]
    ] call FUNC(helper,distanceFrom),

    [
        [format ["%1 upgrade", _name], "performed"],
        _vehicle
    ] call FUNC(helper,isOccupied),

    [
        [format ["%1 upgrade", _name], "performed"],
        _vehicle
    ] call FUNC(helper,isDamaged)
];

if (hasInterface) then {
    if (isNil "_type") then {
        _type = (player getVariable QGVAR(vehicle_upgrade_type)) select 1;

        _this set [1, _type];
    };

    {
        [_checks, _x] call BIS_fnc_arrayPush;
    } forEach [
        [
            format ["%1 upgrade", _name],
            _vehicle getVariable QGVAR(upgrade)
        ] call FUNC(helper,inProgress),

        [
            [format ["%1 upgrade", _name], "performed"],
            player getVariable QGVAR(vehicle_upgrade_cooldown)
        ] call FUNC(helper,timeExceeded)
    ];

    {
        if ([typeName _x, "STRING"] call BIS_fnc_areEqual) exitWith {
            hint _x;
        };
    } forEach _checks;

    if ({[_x, true] call BIS_fnc_areEqual} count _checks < count _checks) exitWith {};

    _vehicle setVariable [QGVAR(upgrade), true, true];

    if !([[true, 2, QGVAR(sound_repair)]] call FUNC(client,stall) && {alive _vehicle}) exitWith {
       _vehicle setVariable [QGVAR(upgrade), false, true];
    };

    player setVariable [QGVAR(vehicle_upgrade_cooldown), time + GVAR(vehicle_upgrade_time_cooldown)];

    if !(isServer) then {
        [gameLogic, "execVM", [_this, __function(upgrade)]] call FUNC(network,mp);
    };
};

if (isServer && {[{[_x, true] call BIS_fnc_areEqual} count _checks, count _checks] call BIS_fnc_areEqual}) then {
    private ["_parent", "_new"];

    if !(alive _vehicle) exitWith {};

    __log format ["%1 -> %2", [typeOf _vehicle] call FUNC(vehicle,name), [_type] call FUNC(vehicle,name)]];

    _parent = [
        position _vehicle,
        direction _vehicle,
        fuel _vehicle,
        damage _vehicle,
        _vehicle getVariable QGVAR(position),
        _vehicle getVariable QGVAR(direction),
        _vehicle getVariable QGVAR(type)
    ];

    [_vehicle] call FUNC(vehicle,delete);

    sleep 0.5;

    _new = createVehicle [_type, [(_parent select 0) select 0, (_parent select 0) select 1, 0], [], 0, "NONE"];
    _new setDir (_parent select 1);
    _new setPos [(_parent select 0) select 0, (_parent select 0) select 1, 0];
    _new setVelocity [0, 0, 0];
    _new setVectorUp surfaceNormal (_parent select 0);

    _new setFuel (_parent select 2);
    _new setDamage (_parent select 3);

    _new setVariable [QGVAR(position), _parent select 4, true];
    _new setVariable [QGVAR(direction), _parent select 5, true];
    _new setVariable [QGVAR(type), _parent select 6, true];

    [true, "execVM", [[_new], FUNCTION(vehicle,handle)]] call FUNC(network,mp);
    [true, "reveal", _new] call FUNC(network,mp);
};