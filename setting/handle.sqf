/**
 * Setting Module (Handler)
 */

#define THIS_MODULE setting
#include "x_macros.sqf"

if (!isNil QMODULE(3d)) then {
    __submodulePP(3d);
};

if (!isNil QMODULE(vehicle_welcome)) then {
    __submodulePP(vehicle_welcome);
};

{
    _type = [_x select 1] call FUNC(THIS_MODULE,type);
    _default = GVAR(setting_type_default) select _forEachIndex;

    if (typeName _type == "ARRAY") then {
        (call compile format ["%1 %2", _type select 0, _default]);
    };

    player setVariable [format ["d_%1", _x select 1], [(_x select 4) find _default, str (_default)]];
} forEach GVAR(setting_type_valid);