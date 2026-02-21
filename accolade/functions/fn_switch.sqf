#define THIS_MODULE accolade
#include "x_macros.sqf"
private ["_selected", "_data", "_proficiency", "_npc", "_description", "_experience", "_state"];

PARAMS_1(_selected);

disableSerialization;

_data = call compile (DIALOG("X_ACCOLADE_DIALOG", 1100) lbData _selected);
_proficiency = [_this, 1, [_data select 0] call FUNC(THIS_MODULE,proficiency)] call FUNC(common,param);

if ((_proficiency select 1) < _selected) exitWith {
    DIALOG("X_ACCOLADE_DIALOG", 1100) lbSetCurSel (_proficiency select 1);
};

{
    DIALOG("X_ACCOLADE_DIALOG", _x) ctrlSetText "";
} forEach [
    1300,
    1301,
    1302,
    1400,
    1401,
    1402,
    1500,
    1501,
    1502,
    1600,
    1601,
    1602
];

_npc = (call compile format ["d_%1_%2_tasks", QUOTE(THIS_MODULE), _data select 0]) select _selected;
_description = _npc select 0;

DIALOG("X_ACCOLADE_DIALOG", 1200) ctrlSetText (
    if ([typeName _description, "ARRAY"] call BIS_fnc_areEqual) then {
        _description select 0
    } else {
        _description
    }
);

_experience = [_data select 2, 0] call BIS_fnc_areEqual;

if !(_experience) then {
    DIALOG("X_ACCOLADE_DIALOG", 1300) ctrlSetText "ca\ui\data\cmdbar_player_ca";
    DIALOG("X_ACCOLADE_DIALOG", 1400) ctrlSetText "accolade\textures\experience.paa";
    DIALOG("X_ACCOLADE_DIALOG", 1500) ctrlSetText "ca\ui\data\cmdbar_background_ca";
    DIALOG("X_ACCOLADE_DIALOG", 1600) ctrlSetText format [" %1", _data select 2];
};

{
    private ["_index"];

    _index = switch (true) do {
        case (_experience): {0};
        default {1};
    };

    if ([_forEachIndex, 3 + _index] call BIS_fnc_areEqual) exitWith {};

    DIALOG("X_ACCOLADE_DIALOG", 1300 + (_forEachIndex + _index)) ctrlSetText "ca\ui\data\cmdbar_player_ca";
    DIALOG("X_ACCOLADE_DIALOG", 1400 + (_forEachIndex + _index)) ctrlSetText (
        getText (configFile >> "CfgWeapons" >> _x >> "picture")
    );
} forEach (_npc select 1);

_state = [
    [_selected, _data select 0] call FUNC(THIS_MODULE,task),
    _proficiency select 0,
    _data select 1
] call FUNC(THIS_MODULE,state);

DIALOG("X_ACCOLADE_DIALOG", 1800) ctrlSetText (_state select 0);
DIALOG("X_ACCOLADE_DIALOG", 1800) ctrlEnable (_state select 2);