/**
 * Base Artillery Module (Handler)
 */

#define THIS_MODULE base_artillery
#include "x_macros.sqf"
private ["_group"];

if !(isServer) exitWith {};

if !(isNil QMODULE(artillery)) then {
    BIS_ARTY_Logic = (group gameLogic) createUnit ["BIS_ARTY_Logic", [0, 0, 0], [], 0, "NONE"];
};

{
    if ([typeOf _x, "M119_US_EP1"] call BIS_fnc_areEqual) then {
        if !(isNil QMODULE(artillery)) then {
            BIS_ARTY_Logic synchronizeObjectsAdd [_x];
        };

        _x addEventHandler ["HandleDamage", {0}];
        _x addEventHandler ["Fired", {deleteVehicle (_this select 6); (_this select 0) setVehicleAmmo 1}];
    };
} forEach ([
    markerPos QGVAR(base_artillery),
    markerDir QGVAR(base_artillery),
    GVAR(base_artillery_composition),
    [
        ["Land_Pneu"],
        ["M2HD_mini_TriPod_US_EP1", "US_WarfareBArtilleryRadar_Base_EP1", 80],
        ["MtvrReammo_DES_EP1", "MTVR_DES_EP1", -40],
        ["Paleta2"],
        ["USOrdnanceBox_EP1"]
    ]
] call FUNC(server,objectMapper));

if !(isNil QMODULE(artillery)) then {
    waitUntil {sleep 0.1; !isNil {BIS_ARTY_Logic getVariable "ARTY_INITIALIZED"}};

    [BIS_ARTY_Logic, true] call BIS_ARTY_F_SetShellSpawn;
};

_group = [
    markerPos QGVAR(base_artillery),
    west,
    (configFile >> "CfgGroups" >> "West" >> "BIS_US" >> "Infantry" >> "US_TeamSupport")
] call FUNC(server,spawnGroup);

{
    _x disableAI "MOVE";
    _x disableAI "AUTOTARGET";
    _x disableAI "TARGET";

    _x setCombatMode "BLUE";
    _x setBehaviour "STEALTH";
} forEach units _group;

if !(isNil QMODULE(unit)) then {
    [_group, markerPos QGVAR(base_artillery)] call FUNC(unit,defend);
};