/**
 * Vehicle MHQ Module - Respawn Submodule
 */

#include "x_macros.sqf"
private ["_types"];

if (!isNil QMODULE(setting)) then {
    _types = [];
    
    {
        _types = _types + [
            getText (configFile >> "CfgVehicles" >> _x >> "DisplayName"),
            _x
        ];
    } forEach GVAR(vehicle_mhq_types);
    
    player setVariable [QGVAR(respawn_types), (player getVariable QGVAR(respawn_types)) + [_types]];
};