/**
 * Setting Module (Handler)
 */

#define THIS_MODULE setting
#include "x_macros.sqf"
private ["_type", "_default"];

if (hasInterface) then {
    if (!isNil QMODULE(3d)) then {
        __submodulePP(3d);
    };

    if (!isNil QMODULE(airdrop)) then {
        __submodulePP(airdrop);
    };

    if (!isNil QMODULE(halo)) then {
        __submodulePP(halo);
    };

    if (!isNil QMODULE(respawn)) then {
        __submodulePP(respawn);
    };

    if (!isNil QMODULE(reward)) then {
        __submodulePP(reward);
    };

    if (!isNil QMODULE(vote)) then {
        __submodulePP(vote);
    };

    if (!isNil QMODULE(tutorial)) then {
        __submodulePP(tutorial);
    };

    {
        _type = [_x select 1] call FUNC(THIS_MODULE,type);
        _default = GVAR(setting_type_default) select _forEachIndex;

        if (!isNil QMODULE(profile)) then {
            private ["_load"];

            _load = [__profile(_x select 1), _default] call FUNC(profile,load);

            _default = if (!isNil "_load") then {_load} else {_default};
        };

        if (typeName _type == "ARRAY") then {
            (call compile format [
                "%1 %2",
                _type select 0,
                _default / 10
            ]);
        };

        player setVariable [
            format ["d_%1", _x select 1],
            [(_x select 4) find _default, _default]
        ];
    } forEach GVAR(setting_type_valid);
};