#include "x_macros.sqf"
private ["_type", "_interaction"];

PARAMS_2(_type, _interaction);

disableSerialization;

{
    DIALOG("X_ACCOLADE_DIALOG", _x) ctrlShow true;
} forEach [
    1000,
    1101,
    1102,
    1200,
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
    1602,
    1700
];

{
    DIALOG("X_ACCOLADE_DIALOG", _x) ctrlShow ([_type, "overview"] call BIS_fnc_areEqual);
} forEach [
    2110,
    2111,
    2112,
    2113,
    2120,
    2121,
    2122,
    2123
];

switch (_type) do {
    case "npc": {
        private ["_listbox"];

        _listbox = DIALOG("X_ACCOLADE_DIALOG", 1100);

        DIALOG("X_ACCOLADE_DIALOG", 400) ctrlSetText format [
            "Tasks (%1)",
            _interaction select 1
        ];

        {
            private ["_index"];

            if !([_x select 1, -1] call BIS_fnc_areEqual) then {
                _index = _listbox lbAdd (_x select 0);

                if !([_forEachIndex, 0] call BIS_fnc_areEqual) then {
                    _listbox lbSetPicture [
                        _index,
                        "ca\ui\data\ui_task_cancelled_ca"
                    ];
                } else {
                    _listbox lbSetPicture [
                        _index,
                        "ca\ui\data\ui_task_assigned_ca"
                    ];
                };
            };
        } forEach GVAR(accolade_types_proficiency);
    };

    case "overview": {
        DIALOG("X_ACCOLADE_DIALOG", 400) ctrlSetText "Proficiencies";

        {
            DIALOG("X_ACCOLADE_DIALOG", 2000 + _forEachIndex) ctrlSetText (_x select 1);
            DIALOG("X_ACCOLADE_DIALOG", 2100 + _forEachIndex) ctrlSetText (
                getText (configFile >> "CfgVehicles" >> (_x select 2) >> "portrait")
            );

            _select = [0, 0.2, 0.4, 0.6, 0.8, 1] call BIS_fnc_selectRandom;

            DIALOG("X_ACCOLADE_DIALOG", 2200 + _forEachIndex) progressSetPosition _select;
            DIALOG("X_ACCOLADE_DIALOG", 2210 + _forEachIndex) progressSetPosition 1;
            DIALOG("X_ACCOLADE_DIALOG", 2300 + _forEachIndex) ctrlSetText (([0, GVAR(accolade_types_proficiency)] call FUNC(common,arrayValues)) select ([0, 0.2, 0.4, 0.6, 0.8, 1] find _select));
        } forEach GVAR(accolade_types);
    };
};