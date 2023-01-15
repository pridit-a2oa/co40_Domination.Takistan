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
        if (typeName _x == "STRING") exitWith {
            hint _x;
        };
    } forEach _checks;
};

if (isServer || {(hasInterface && {str (_x) == "true"} count _checks == count _checks)}) then {
    private ["_find", "_textures", "_texture"];

    _find = [_vehicle] call FUNC(THIS_MODULE,find);

    _textures = _find select 0;
    _texture = _find select 1;

    {
        private ["_index", "_colour", "_type"];

        _index = (_forEachIndex + 1);
        _colour = if ([typeName _x, "ARRAY"] call BIS_fnc_areEqual) then {_x select 0} else {_x};

        if (_colour == _vehicle getVariable QGVAR(texture)) exitWith {
            _type = _textures select _index;

            if ([typeName _type, "ARRAY"] call BIS_fnc_areEqual) then {
                _type = _type select 0;
            };

            if (count _textures == _index) then {
                _type = _textures select 0;
                _index = 0;
            };

            _vehicle setVariable [QGVAR(texture), _type, true];
            
            [true, "execVM", [[_vehicle, _type], __function(switch)]] call FUNC(network,mp);
        };
    } forEach _textures;
};