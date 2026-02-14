#define THIS_MODULE accolade
#include "x_macros.sqf"
private ["_type", "_interaction", "_experience", "_rank", "_listbox"];

PARAMS_2(_type, _interaction);

disableSerialization;

_experience = ((round (random 1000)) max 0) min 1000;
_rank = [_experience] call FUNC(THIS_MODULE,rank);

createDialog "XD_AccoladeDialog";

{
    DIALOG("X_ACCOLADE_DIALOG", 100 + _forEachIndex) ctrlSetText format [
        "\ca\warfare2\Images\rank_%1",
        toLower (_x select 0)
    ];

    DIALOG("X_ACCOLADE_DIALOG", 300 + _forEachIndex) ctrlSetText format ["%1", _x select 1];
} forEach [
    _rank select 0,
    _rank select 1
];

DIALOG("X_ACCOLADE_DIALOG", 200) progressSetPosition (
    (_experience - ((_rank select 0) select 1)) / (((_rank select 1) select 1) - ((_rank select 0) select 1))
);
DIALOG("X_ACCOLADE_DIALOG", 201) progressSetPosition 1;
DIALOG("X_ACCOLADE_DIALOG", 302) ctrlSetText format ["%1", _experience];
DIALOG("X_ACCOLADE_DIALOG", 500) ctrlShow !([_interaction, []] call BIS_fnc_areEqual);

if !([_interaction, ""] call BIS_fnc_areEqual) then {
    DIALOG("X_ACCOLADE_DIALOG", 500) ctrlSetText (if ([_type, "overview"] call BIS_fnc_areEqual) then {
        "Back"
    } else {
        "Overview"
    });

    DIALOG("X_ACCOLADE_DIALOG", 500) buttonSetAction format [
        "closeDialog 0; ['%1', %2] call d_fnc_accolade_show",
        if ([_type, "overview"] call BIS_fnc_areEqual) then {"npc"} else {"overview"},
        _interaction
    ]
};

[_type, _interaction] call FUNC(THIS_MODULE,view);