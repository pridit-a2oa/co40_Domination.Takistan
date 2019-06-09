/**
 * Setting Module (Handler)
 */

#define THIS_MODULE setting
#include "x_macros.sqf"

{
    _type = [_x select 1] call FUNC(THIS_MODULE,type);
    _default = GVAR(setting_type_default) select _forEachIndex;
    
    if (typeName _type == "ARRAY") then {
        (call compile format ["%1 %2", _type select 0, _default]);
    };
    
    missionNamespace setVariable [format ["d_%1", _x select 1], (_x select 3) find _default];
} forEach GVAR(setting_type_valid);