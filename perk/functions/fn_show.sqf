#include "x_macros.sqf"
private ["_points", "_unlocked", "_roles"];

disableSerialization;

createDialog "XD_PerkDialog";

_points = player getVariable QGVAR(perk_points);
_unlocked = player getVariable QGVAR(perk_ids);

DIALOG("X_PERK_DIALOG", 1) ctrlSetText (str _points);

if (_points > 0) then {
    for "_i" from 1 to 10 do {
        DIALOG("X_PERK_DIALOG", 200 + _i) ctrlSetText "\ca\ui\data\cmdbar_player_ca";
    };
};

_roles = [0, GVAR(perk_type_roles)] call FUNC(common,arrayValues);

{
    if (str player in _x) exitWith {
        _unlockable = ([1, GVAR(perk_type_roles)] call FUNC(common,arrayValues)) select _forEachIndex;
        
        {
            _column = _x;
            
            DIALOG("X_PERK_DIALOG", 500 + _column) ctrlSetText "\ca\ui\data\icon_task_ca";
            
            for "_i" from 1 to 5 do {
                if (_points < 1) exitWith {};
                
                DIALOG("X_PERK_DIALOG", 200 + (_column * 10) + _i) ctrlSetText "\ca\ui\data\cmdbar_player_ca";
                
                if (_unlocked find ((_column * 10) + _i) == -1) exitWith {};
            };
        } forEach _unlockable;
    };
} forEach _roles;

{
    DIALOG("X_PERK_DIALOG", 200 + _x) ctrlSetText "\ca\ui\data\cmdbar_selected_ca";
    DIALOG("X_PERK_DIALOG", 200 + _x) ctrlSetTextColor [1, 1, 1, 0.7];
} forEach _unlocked;