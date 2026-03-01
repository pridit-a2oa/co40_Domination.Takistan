/**
 * Ammobox Module - Base Ammobox Submodule
 */

#define THIS_MODULE ammobox
#include "x_macros.sqf"

GVAR(base_ammobox) = [
    faction player,
    markerPos QGVAR(player_ammobox_pos),
    markerDir QGVAR(player_ammobox_pos),
    true
] call FUNC(THIS_MODULE,create);

GVAR(base_ammobox) setVariable [QGVAR(immune), true];

[GVAR(base_ammobox)] execFSM FSM(THIS_MODULE,respawn);

if !(isNil QMODULE(database)) then {
    [gameLogic, "spawn", [[player, getPlayerUID player], {
        private ["_unit", "_uid"];

        PARAMS_2(_unit, _uid);

        _key = [_uid] call FUNC(database,key);

        if (isMultiplayer) then {
            waitUntil {sleep 0.5; !isNil {serverNamespace getVariable _key}};
        };

        if ([((serverNamespace getVariable _key) select 1) select 0, ""] call BIS_fnc_areEqual) exitWith {};

        [_unit, "spawn", [[], {
            if (isNil {GVAR(base_ammobox)}) exitWith {};

            [GVAR(ammobox_type_rifles_assault), "AKS_GOLD"] call BIS_fnc_arrayPush;
            [GVAR(ammobox_type_handguns), "revolver_gold_EP1"] call BIS_fnc_arrayPush;

            [GVAR(base_ammobox), true] call FUNC(THIS_MODULE,replenish);
        }]] call FUNC(network,mp);
    }]] call FUNC(network,mp);
};