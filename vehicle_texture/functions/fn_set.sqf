#define THIS_MODULE vehicle_texture
#include "x_macros.sqf"
private ["_vehicle", "_checks"];

PARAMS_1(_vehicle);

if (hasInterface) then {
    private ["_name"];

    _name = [typeOf _vehicle] call FUNC(vehicle,name);
    _checks = [
        [
            [format ["%1 texture", _name], "changed"],
            _vehicle
        ] call FUNC(helper,isOccupied),

        [
            [format ["%1 texture", _name], "changed"],
            markerPos QGVAR(base_south),
            position _vehicle,
            [GVAR(vehicle_texture_distance_base), "within", "of base"]
        ] call FUNC(helper,distanceFrom)
    ];

    {
        if ([typeName _x, "STRING"] call BIS_fnc_areEqual) exitWith {
            hint _x;
        };
    } forEach _checks;
};

if (isServer || {(hasInterface && {[{[_x, true] call BIS_fnc_areEqual} count _checks, count _checks] call BIS_fnc_areEqual})}) then {
    private ["_textures"];

    _textures = ([_vehicle] call FUNC(THIS_MODULE,textures)) select 1;

    {
        private ["_index", "_colour", "_type"];

        _index = _forEachIndex + 1;
        _colour = if ([typeName _x, "ARRAY"] call BIS_fnc_areEqual) then {_x select 0} else {_x};

        if ([_colour, (_vehicle getVariable QGVAR(texture)) select 0] call BIS_fnc_areEqual) exitWith {
            _type = [_textures select _index] call FUNC(THIS_MODULE,type);

            if ([count _textures, _index] call BIS_fnc_areEqual) then {
                _type = [_textures select 0];
                _index = 0;
            };

            _vehicle setVariable [QGVAR(texture), _type, true];

            [true, "execVM", [[_vehicle, _type], __function(switch)]] call FUNC(network,mp);
        };
    } forEach _textures;
};