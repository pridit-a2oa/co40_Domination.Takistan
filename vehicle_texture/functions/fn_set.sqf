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
        private ["_index", "_type", "_new"];

        _index = (_forEachIndex + 1);

        if (_x == (_vehicle getVariable QGVAR(texture)) select 0) exitWith {
            _type = _textures select _index;

            if (count _textures == _index) then {
                _type = _textures select 0;
                _index = 0;
            };

            _new = ([1, (GVAR(vehicle_texture_types) select _texture) select 1] call FUNC(common,arrayValues)) select _index;

            _vehicle setVariable [
                QGVAR(texture),
                [
                    _type,
                    _new
                ],
                true
            ];

            {
                [true, "setObjectTexture", [_vehicle, [_forEachIndex, format ["%1.paa", _x]]]] call FUNC(network,mp);
            } forEach _new;
        };
    } forEach _textures;
};