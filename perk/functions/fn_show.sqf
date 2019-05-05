#include "x_macros.sqf"
#define __ctrl(vctrl) _ctrl = _XD_display displayCtrl vctrl
#define __ctrl2(ectrl) (_XD_display displayCtrl ectrl)
private ["_ctrl", "_XD_display", "_points", "_unlocked"];
if (!X_Client) exitWith {};

disableSerialization;

createDialog "XD_PerkDialog";

_XD_display = uiNamespace getVariable "X_PERK_DIALOG";

_points = player getVariable QGVAR(perk_points);
_unlocked = player getVariable QGVAR(perks_unlocked);

__ctrl(1) ctrlSetText (str _points);

if (_points > 0) then {
    for "_i" from 1 to 10 do {
        __ctrl2(200 + _i) ctrlSetText "\ca\ui\data\cmdbar_player_ca";
    };
};

if (GVAR(artillery) find (str(player)) != -1) then {
    __ctrl2(501) ctrlSetText "\ca\ui\data\icon_task_ca";
    for "_i" from 1 to 5 do {
        if (_points < 1) exitWith {};
        __ctrl2(210 + _i) ctrlSetText "\ca\ui\data\cmdbar_player_ca";
        if (_unlocked find (10 + _i) == -1) exitWith {};
    };
};

if (GVAR(engineers) find (str(player)) != -1) then {
    __ctrl2(502) ctrlSetText "\ca\ui\data\icon_task_ca";
    for "_i" from 1 to 5 do {
        if (_points < 1) exitWith {};
        __ctrl2(220 + _i) ctrlSetText "\ca\ui\data\cmdbar_player_ca";
        if (_unlocked find (20 + _i) == -1) exitWith {};
    };
};

if (GVAR(machine_gunners) find (str(player)) != -1) then {
    __ctrl2(503) ctrlSetText "\ca\ui\data\icon_task_ca";
    for "_i" from 1 to 5 do {
        if (_points < 1) exitWith {};
        __ctrl2(230 + _i) ctrlSetText "\ca\ui\data\cmdbar_player_ca";
        if (_unlocked find (30 + _i) == -1) exitWith {};
    };
};

if (GVAR(marksman) find (str(player)) != -1) then {
    __ctrl2(504) ctrlSetText "\ca\ui\data\icon_task_ca";
    for "_i" from 1 to 5 do {
        if (_points < 1) exitWith {};
        __ctrl2(240 + _i) ctrlSetText "\ca\ui\data\cmdbar_player_ca";
        if (_unlocked find (40 + _i) == -1) exitWith {};
    };
};

if (GVAR(medics) find (str(player)) != -1) then {
    __ctrl2(505) ctrlSetText "\ca\ui\data\icon_task_ca";
    for "_i" from 1 to 5 do {
        if (_points < 1) exitWith {};
        __ctrl2(250 + _i) ctrlSetText "\ca\ui\data\cmdbar_player_ca";
        if (_unlocked find (50 + _i) == -1) exitWith {};
    };
};

if (GVAR(pilots) find (str(player)) != -1) then {
    __ctrl2(506) ctrlSetText "\ca\ui\data\icon_task_ca";
    for "_i" from 1 to 5 do {
        if (_points < 1) exitWith {};
        __ctrl2(260 + _i) ctrlSetText "\ca\ui\data\cmdbar_player_ca";
        if (_unlocked find (60 + _i) == -1) exitWith {};
    };
};

{
    __ctrl2(200 + _x) ctrlSetText "\ca\ui\data\cmdbar_selected_ca";
    __ctrl2(200 + _x) ctrlSetTextColor [1, 1, 1, 0.7];
} forEach _unlocked;

0 spawn {
    scriptName "spawn_waitforperkdialogclose";
    waitUntil {!GVAR(perk_dialog_open) || {!alive player}};
    if (GVAR(perk_dialog_open)) then {closeDialog 0};
};