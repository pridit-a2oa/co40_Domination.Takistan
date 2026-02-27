#define THIS_MODULE accolade
#include "x_macros.sqf"
private ["_type", "_interaction", "_experience", "_progress", "_listbox"];

PARAMS_2(_type, _interaction);

disableSerialization;

_experience = player getVariable QGVAR(experience);
_progress = [_experience] call FUNC(THIS_MODULE,progress);

createDialog format [
    "XD_Accolade%1Dialog",
    switch (_type) do {
        case "npc": {"Discipline"},
        case "overview": {"Overview"}
    }
];

{
    DIALOG("X_ACCOLADE_DIALOG", 100 + _forEachIndex) ctrlSetText format [
        "\ca\warfare2\Images\rank_%1",
        toLower (_x select 0)
    ];

    DIALOG("X_ACCOLADE_DIALOG", 110 + _forEachIndex) ctrlSetTooltip (_x select 0);
    DIALOG("X_ACCOLADE_DIALOG", 300 + _forEachIndex) ctrlSetText (str (_x select 1));
} forEach [
    _progress select 0,
    _progress select 1
];

DIALOG("X_ACCOLADE_DIALOG", 112) ctrlSetTooltip (
    str (((_progress select 1) select 1) - _experience)
);

DIALOG("X_ACCOLADE_DIALOG", 200) progressSetPosition (
    (_experience - ((_progress select 0) select 1)) / (((_progress select 1) select 1) - ((_progress select 0) select 1))
);
DIALOG("X_ACCOLADE_DIALOG", 201) progressSetPosition 1;
DIALOG("X_ACCOLADE_DIALOG", 302) ctrlSetText format [" %1", _experience];
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

// TODO: Remove when stable
if ([_type, "npc"] call BIS_fnc_areEqual && {[{[_x, [[0, 0], [0, 0], [0, 0], [0,0], [0, 0]]] call BIS_fnc_areEqual} count (player getVariable QGVAR(tasks)), count GVAR(accolade_types)] call BIS_fnc_areEqual}) then {
    hint parseText "<br /><t size='1.1'>Accolades is a new, very <t color='#a3ae55'>experimental</t> system, and lacks exhaustive testing.<br /><br />Expect problems or entire <t color='#c54a30'>progress wipes</t> until this feature is stable.<br /><br />";
};