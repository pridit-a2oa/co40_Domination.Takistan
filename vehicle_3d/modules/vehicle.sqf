/**
 * Vehicle 3D Module - Vehicle Submodule
 */

#define THIS_MODULE vehicle_3d
#include "x_macros.sqf"
private ["_vehicle", "_description", "_name"];

PARAMS_1(_vehicle);

_description = [typeOf _vehicle] call FUNC(THIS_MODULE,description);

if ([_description, ""] call BIS_fnc_areEqual) exitWith {};

_name = [typeOf _vehicle] call FUNC(vehicle,name);

if !(isNil QMODULE(3d)) then {
    private ["_color"];
    
    _color = switch (faction _vehicle) do {
        case "BIS_TK": {"Red"};
        case "BIS_TK_INS": {"Red"};
        default {"Blue"};
    };

    [
        _vehicle,
        format [
            "<t size='0.8'>%1</t><t color='#f0bfbfbf' size='0.6'>%2</t>",
            (call compile format [
                "'%1' call d_fnc_common_%2Text",
                ([typeOf _vehicle] call FUNC(vehicle,name)),
                _color
            ]),
            _description
        ],
        [2, 6],
        true
    ] spawn FUNC(3d,create);
};