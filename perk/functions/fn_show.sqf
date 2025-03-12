#define THIS_MODULE perk
#include "x_macros.sqf"
private ["_points", "_unlocked", "_override", "_roles"];

disableSerialization;

createDialog "XD_PerkDialog";

if (!isNil QMODULE(database) && {X_JIPH getVariable QGVAR(holiday)}) then {
    DIALOG("X_PERK_DIALOG", 20) ctrlSetText "Happy Holidays!\nMax points & restrictions lifted until Jan 3rd";
} else {
    DIALOG("X_PERK_DIALOG", 10) ctrlSetText "Left-click: Unlock perk\nHover: Show info\nReconnect to reset";
};

_points = player getVariable QGVAR(perk_points);
_unlocked = player getVariable QGVAR(perk_ids);

_override = call FUNC(THIS_MODULE,override);

DIALOG("X_PERK_DIALOG", 1) ctrlSetText (
    if (_override) then {
        str (40 - count _unlocked)
    } else {
        str _points
    }
);

if (_points > 0 || {_override}) then {
    for "_i" from 1 to 10 do {
        DIALOG("X_PERK_DIALOG", 200 + _i) ctrlSetText "\ca\ui\data\cmdbar_player_ca";
    };
};

_roles = [0, GVAR(perk_type_roles)] call FUNC(common,arrayValues);

{
    private ["_unlockable"];

    if (str player in _x) then {
        _unlockable = switch (true) do {
            case (_override): {
                [1, 2, 3, 4, 5, 6]
            };

            default {
                ([1, GVAR(perk_type_roles)] call FUNC(common,arrayValues)) select _forEachIndex
            };
        };

        {
            private ["_column"];

            _column = _x;

            DIALOG("X_PERK_DIALOG", 500 + _column) ctrlSetTextColor [0.8784, 0.8471, 0.651, 0.9];

            for "_i" from 1 to 5 do {
                if ([_points, 0] call BIS_fnc_areEqual && {!_override}) exitWith {};

                DIALOG("X_PERK_DIALOG", 200 + (_column * 10) + _i) ctrlSetText "\ca\ui\data\cmdbar_player_ca";

                if ([_unlocked find ((_column * 10) + _i), -1] call BIS_fnc_areEqual) exitWith {};
            };
        } forEach _unlockable;
    };
} forEach _roles;

{
    DIALOG("X_PERK_DIALOG", 200 + _x) ctrlSetText "\ca\ui\data\cmdbar_selected_ca";
    DIALOG("X_PERK_DIALOG", 200 + _x) ctrlSetTextColor [1, 1, 1, 0.7];
} forEach _unlocked;