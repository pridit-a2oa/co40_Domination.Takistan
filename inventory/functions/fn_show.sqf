#include "x_macros.sqf"
private ["_available"];

disableSerialization;

createDialog "XD_InventoryDialog";

_available = GVAR(inventory_amount_slots);

{
    private ["_slot", "_amount", "_icon"];

    _slot = abs (_available - GVAR(inventory_amount_slots));
    _amount = player getVariable (format [QUOTE(d_%1), _x select 0]);

    if (_amount > 0) then {
        DIALOG("X_INVENTORY_DIALOG", 100 + (_slot + 1)) ctrlSetText (_x select 1);
        DIALOG("X_INVENTORY_DIALOG", 300 + (_slot + 1)) ctrlSetTextColor [1, 1, 1, 1];
        DIALOG("X_INVENTORY_DIALOG", 400 + (_slot + 1)) ctrlSetText (str (_amount min 99));

        if ([_x select 1, "ca\ui\data\icon_mission_repair_ca"] call BIS_fnc_areEqual) then {
            _icon = DIALOG("X_INVENTORY_DIALOG", 100 + (_slot + 1));
            _icon ctrlSetPosition [(ctrlPosition _icon) select 0, ((ctrlPosition _icon) select 1) + 0.003];
            _icon ctrlCommit 0;
        };

        if (_x select 1 in ["ca\ui\data\icon_mission_repair_ca", "ca\ui\data\icon_unit_agony_ca"]) then {
            DIALOG("X_INVENTORY_DIALOG", 200 + (_slot + 1)) ctrlSetText "ca\ui\data\markers\n_unknown";
        };

        _available = _available - 1;
    };
} forEach GVAR(inventory_type_visible);