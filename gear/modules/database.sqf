/**
 * Gear Module - Database Submodule
 */

#define THIS_MODULE gear
#include "x_macros.sqf"
private ["_identifier"];

PARAMS_1(_identifier);

if (isServer) then {
    private ["_key", "_data"];

    _key = [_identifier select 1, _identifier select 2] call FUNC(THIS_MODULE,key);

    if (isMultiplayer) then {
        waitUntil {sleep 0.5; isNil {serverNamespace getVariable _key}};
    };

    _data = [format [
        "SELECT data FROM character_gear WHERE character_id = '%1' LIMIT 1",
        _identifier select 0
    ]] call FUNC(database,query);

    serverNamespace setVariable [
        _key,
        [
            _identifier,
            if ([_data, []] call BIS_fnc_areEqual) then {
                []
            } else {
                call compile ((_data select 0) select 0)
            }
        ]
    ];
};