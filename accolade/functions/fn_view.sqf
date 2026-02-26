#define THIS_MODULE accolade
#include "x_macros.sqf"
private ["_type", "_interaction"];

PARAMS_2(_type, _interaction);

disableSerialization;

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
            DIALOG("X_ACCOLADE_DIALOG", 2400 + _forEachIndex) ctrlSetTooltip (
                switch (true) do {
                    case !([_proficiency select 3, ""] call BIS_fnc_areEqual): {
                        if ([typeName (_proficiency select 3), "ARRAY"] call BIS_fnc_areEqual) exitWith {
                            (_proficiency select 3) select 0
                        };

                        _proficiency select 3
                    };

                    default {
                        "No active task"
                    };
                }
            );
        } forEach GVAR(accolade_types);
    };
};