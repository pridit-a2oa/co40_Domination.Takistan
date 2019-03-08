#define __ctrl(vctrl) _ctrl = _XD_display displayCtrl vctrl
#define __ctrl2(ectrl) (_XD_display displayCtrl ectrl)
private ["_ctrl","_XD_display","_unlocked"];
if (!X_Client) exitWith {};

disableSerialization;

createDialog "XD_PerkDialog";

_XD_display = __uiGetVar(X_PERK_DIALOG);

__ctrl(1) ctrlSetText (str __pGetVar(GVAR(perk_points_available)));

if (__pGetVar(GVAR(perk_points_available)) > 0) then {
    for "_i" from 1 to 10 do {
        __ctrl2(200 + _i) ctrlSetText "\ca\ui\data\cmdbar_player_ca";
    };
};

{
    __ctrl2(100 + _x) ctrlSetText "\ca\ui\data\cmdbar_selected_ca";
    __ctrl2(200 + _x) ctrlSetText "";
} forEach __pGetVar(GVAR(perks_unlocked));

{
    if (str(player) == _x) then {
         __ctrl2(501) ctrlSetText "\ca\ui\data\icon_task_ca";
    };
} forEach GVAR(artillery);

{
    if (str(player) == _x) then {
         __ctrl2(502) ctrlSetText "\ca\ui\data\icon_task_ca";
    };
} forEach GVAR(engineers);

{
    if (str(player) == _x) then {
         __ctrl2(503) ctrlSetText "\ca\ui\data\icon_task_ca";
    };
} forEach GVAR(machine_gunners);

{
    if (str(player) == _x) then {
         __ctrl2(504) ctrlSetText "\ca\ui\data\icon_task_ca";
    };
} forEach GVAR(marksmen);

{
    if (str(player) == _x) then {
         __ctrl2(505) ctrlSetText "\ca\ui\data\icon_task_ca";
    };
} forEach GVAR(medics);

{
    if (str(player) == _x) then {
         __ctrl2(506) ctrlSetText "\ca\ui\data\icon_task_ca";
    };
} forEach GVAR(pilots);

0 spawn {
    scriptName "spawn_waitforperkdialogclose";
    waitUntil {!GVAR(perk_dialog_open) || {!alive player} || {__pGetVar(xr_pluncon)}};
    if (GVAR(perk_dialog_open)) then {closeDialog 0};
};