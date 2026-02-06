#include "x_macros.sqf"
private ["_type", "_interaction"];

PARAMS_1(_type);

disableSerialization;

_interaction = [_this, 1, true] call FUNC(common,param);

createDialog "XD_AccoladeDialog";

// if ([_type, "overview"] call BIS_fnc_areEqual) exitWith {
//     // Show alternate view, disable overview if not _interaction
// };

DIALOG("X_ACCOLADE_DIALOG", 1000) progressSetPosition 0.5; // (Current XP / Next Rank) for scale, e.g. 100 / 200 = 0.5
DIALOG("X_ACCOLADE_DIALOG", 999) progressSetPosition 1;

_listbox = DIALOG("X_ACCOLADE_DIALOG", 2000);

{
    _index = _listbox lbAdd _x;

    if !([_forEachIndex, 0] call BIS_fnc_areEqual) then {
        _listbox lbSetPicture [
            _index,
            "ca\ui\data\lock_on_ca"
        ];
    };
} forEach [
    "Beginner",
    "Novice",
    "Intermediate",
    "Advanced",
    "Expert"
];