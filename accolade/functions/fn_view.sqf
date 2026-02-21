#define THIS_MODULE accolade
#include "x_macros.sqf"
private ["_type", "_interaction"];

PARAMS_2(_type, _interaction);

disableSerialization;

{
    private ["_index"];

    _index = _x select 0;

    DIALOG("X_ACCOLADE_DIALOG", _index) ctrlShow (
        [_type, _x select 1] call BIS_fnc_areEqual
    );
} forEach [
    [1000,  "npc"],
    [1100,  "npc"],
    [1101,  "npc"],
    [1102,  "npc"],
    [1200,  "npc"],
    [1300,  "npc"],
    [1301,  "npc"],
    [1302,  "npc"],
    [1310,  "npc"],
    [1311,  "npc"],
    [1312,  "npc"],
    [1400,  "npc"],
    [1401,  "npc"],
    [1402,  "npc"],
    [1500,  "npc"],
    [1501,  "npc"],
    [1502,  "npc"],
    [1600,  "npc"],
    [1601,  "npc"],
    [1602,  "npc"],
    [1700,  "npc"],
    [1800,  "npc"],
    [2110,  "overview"],
    [2111,  "overview"],
    [2112,  "overview"],
    [2113,  "overview"],
    [2120,  "overview"],
    [2121,  "overview"],
    [2122,  "overview"],
    [2123,  "overview"],
    [2300,  "overview"],
    [2301,  "overview"],
    [2302,  "overview"],
    [2303,  "overview"],
    [2400,  "overview"]
];

switch (_type) do {
    case "npc": {
        private ["_listbox", "_proficiency"];

        _listbox = DIALOG("X_ACCOLADE_DIALOG", 1100);

        DIALOG("X_ACCOLADE_DIALOG", 400) ctrlSetText format [
            "Tasks: %1",
            _interaction select 1
        ];

        _proficiency = [_interaction select 0] call FUNC(THIS_MODULE,proficiency);

        {
            if !([_x select 1, -1] call BIS_fnc_areEqual) then {
                private ["_index", "_state"];

                _index = _listbox lbAdd (_x select 0);

                _listbox lbSetData [
                    _forEachIndex,
                    str [_interaction select 0, _x select 0, _x select 1]
                ];

                _state = [
                    [_index, _interaction select 0] call FUNC(THIS_MODULE,task),
                    _proficiency select 0,
                    _x select 0
                ] call FUNC(THIS_MODULE,state);

                _listbox lbSetPicture [_index, _state select 1];
            };
        } forEach GVAR(accolade_types_proficiency);

        DIALOG("X_ACCOLADE_DIALOG", 1100) lbSetCurSel (_proficiency select 1);
    };

    case "overview": {
        DIALOG("X_ACCOLADE_DIALOG", 400) ctrlSetText "Proficiencies";

        {
            DIALOG("X_ACCOLADE_DIALOG", 2000 + _forEachIndex) ctrlSetText (_x select 1);
            DIALOG("X_ACCOLADE_DIALOG", 2100 + _forEachIndex) ctrlSetText (
                getText (configFile >> "CfgVehicles" >> (_x select 2) >> "portrait")
            );
            DIALOG("X_ACCOLADE_DIALOG", 2210 + _forEachIndex) progressSetPosition 1;
        } forEach GVAR(accolade_types);

        {
            private ["_proficiency"];

            _proficiency = [_x select 0, true] call FUNC(THIS_MODULE,proficiency);

            DIALOG("X_ACCOLADE_DIALOG", 2200 + _forEachIndex) progressSetPosition (_proficiency select 2);
            DIALOG("X_ACCOLADE_DIALOG", 2300 + _forEachIndex) ctrlSetTooltip (_proficiency select 0);
        } forEach GVAR(accolade_types);
    };
};