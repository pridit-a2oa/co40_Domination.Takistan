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
    [gameLogic, "spawn", [[player], {
        private ["_unit", "_id"];

        PARAMS_1(_unit);

        waitUntil {
            sleep 1;

            !([[GVAR(database_uid), getPlayerUID _unit] call BIS_fnc_findNestedElement, []] call BIS_fnc_areEqual);
        };

        _id = [GVAR(database_uid), getPlayerUID _unit] call BIS_fnc_findNestedElement;

        if ([(GVAR(database_uid) select (_id select 0)) select 1, ""] call BIS_fnc_areEqual) exitWith {};

        [_unit, "spawn", [[], {
            [GVAR(ammobox_type_rifles_assault), "AKS_GOLD"] call BIS_fnc_arrayPush;
            [GVAR(ammobox_type_handguns), "revolver_gold_EP1"] call BIS_fnc_arrayPush;

            [GVAR(base_ammobox), true] call FUNC(THIS_MODULE,replenish);
        }]] call FUNC(network,mp);
    }]] call FUNC(network,mp);
};