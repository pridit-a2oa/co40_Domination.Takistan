/**
 * Setting Module (Handler)
 */

#define THIS_MODULE setting
#include "x_macros.sqf"

if (hasInterface) then {
    if (!isNil QMODULE(3d)) then {
        __submodulePP(3d);
    };

    if (!isNil QMODULE(airdrop)) then {
        __submodulePP(airdrop);
    };

    if (!isNil QMODULE(respawn)) then {
        __submodulePP(respawn);
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
        
        _value = _default;
        
        if (typeName _default != "STRING") then {
            _value = str _value;
        };

        player setVariable [format ["d_%1", _x select 1], [(_x select 4) find _default, _value]];
    } forEach GVAR(setting_type_valid);
};