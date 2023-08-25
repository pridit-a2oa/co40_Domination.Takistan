/**
 * Vehicle Texture Module - Vehicle Submodule
 */

#define THIS_MODULE vehicle_texture
#include "x_macros.sqf"
private ["_vehicle", "_type"];

PARAMS_1(_vehicle);

_type = [GVAR(vehicle_texture_types), typeOf _vehicle] call BIS_fnc_findNestedElement;

if ([_type, []] call BIS_fnc_areEqual) exitWith {};

if (isServer) then {
    _vehicle setVariable [
        QGVAR(texture),
        [(((GVAR(vehicle_texture_types) select (_type select 0)) select 1) select 0) select 0],
        true
    ];
};

if (hasInterface) then {
    waitUntil {
        sleep 0.1;
        
        !isNil {_vehicle getVariable QGVAR(texture)}
    };

    [_vehicle] call FUNC(THIS_MODULE,switch);
};