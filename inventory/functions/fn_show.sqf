#include "x_macros.sqf"
private ["_available", "_slot", "_amount"];

disableSerialization;

createDialog "XD_InventoryDialog";

_available = GVAR(inventory_amount_slots);

{
    _slot = abs (_available - GVAR(inventory_amount_slots));
    _amount = player getVariable (format [QUOTE(d_%1), _x select 0]);
    
    if (_amount > 0) then {
        DIALOG("X_INVENTORY_DIALOG", 100 + (_slot + 1)) ctrlSetText (_x select 1);
        DIALOG("X_INVENTORY_DIALOG", 300 + (_slot + 1)) ctrlSetTextColor [1, 1, 1, 1];
        DIALOG("X_INVENTORY_DIALOG", 400 + (_slot + 1)) ctrlSetText (str (_amount min 99));
        
        if (_x select 2) then {
            DIALOG("X_INVENTORY_DIALOG", 200 + (_slot + 1)) ctrlSetText "ca\ui\data\markers\n_unknown";
        };
        
        _available = _available - 1;
    };
} forEach GVAR(inventory_type_visible);