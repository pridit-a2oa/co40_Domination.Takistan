#define THIS_MODULE vehicle_menu
#include "x_macros.sqf"
private ["_vehicle", "_menu", "_lbCurSel", "_lbData", "_refresh"];

disableSerialization;

_vehicle = GVAR(vehicle_dialog);

if (!alive _vehicle) exitWith {};

_menu = DIALOG("X_VEHICLE_MENU_DIALOG", 1500);

_lbCurSel = lbCurSel _menu;
_lbData = _menu lbData _lbCurSel;
_lbData = if ([_lbData, "["] call KRON_StrInStr) then {call compile _lbData} else {_lbData};

if (_lbCurSel == -1 || {player distance _vehicle > 10} || {!(simulationEnabled _vehicle)}) exitWith {
    closeDialog 0;
};

_refresh = switch (if (typeName _lbData == "ARRAY") then {_lbData select 0} else {_lbData}) do {
    if !(isNil QMODULE(vehicle_ammobox)) then {
        case "ammobox": {
            private ["_ammobox"];

            _ammobox = _vehicle getVariable QGVAR(ammobox);

            closeDialog 0;

            if (!isNil "_ammobox" && {_ammobox}) exitWith {
                [_vehicle] call FUNC(vehicle_ammobox,unload);

                false
            };

            !([_vehicle] call FUNC(vehicle_ammobox,load));
        };
    };

    if !(isNil QMODULE(vehicle_create)) then {
        case "create": {
            if !([_vehicle, _lbData select 1] call FUNC(vehicle_create,spawn)) exitWith {
                true
            };

            closeDialog 0;

            false
        };
    };

    if !(isNil QMODULE(vehicle_deploy)) then {
        case "deploy": {
            private ["_deployed"];

            _deployed = (_vehicle getVariable QGVAR(deployed)) select 0;
            
            if (!isNil "_deployed" && {_deployed}) exitWith {
                [_vehicle, _lbData select 1, false] call FUNC(vehicle_deploy,deploy);
            };
            
            [_vehicle, _lbData select 1, true] call FUNC(vehicle_deploy,deploy);
            
            true
        };
    };

    if !(isNil QMODULE(inventory) && {isNil QMODULE(inventory_medical)}) then {
        case "inventory_medical": {
            ["medical"] call FUNC(inventory,replenish);

            true
        };
    };

    if !(isNil QMODULE(inventory) && {isNil QMODULE(inventory_refuel)}) then {
        case "inventory_refuel": {
            ["refuel"] call FUNC(inventory,replenish);

            true
        };
    };

    if !(isNil QMODULE(inventory) && {isNil QMODULE(inventory_repair)}) then {
        case "inventory_repair": {
            ["repair"] call FUNC(inventory,replenish);

            true
        };
    };

    if !(isNil QMODULE(vehicle_loadout)) then {
        case "loadout": {
            if (count ([_vehicle] call FUNC(vehicle_loadout,find) select 0) > 1) then {
                [_vehicle] call FUNC(vehicle_loadout,set);
            };

            true
        };
    };

    if !(isNil QMODULE(vehicle_pack)) then {
        case "pack": {
            private ["_packed"];

            if !(isEngineOn _vehicle) then {        
                _packed = _vehicle getVariable QGVAR(packed);
                
                if (!isNil "_packed" && {_packed}) exitWith {
                    [_vehicle, 0] call FUNC(vehicle_pack,fold);

                    true
                };
                
                [_vehicle, 1] call FUNC(vehicle_pack,fold);

                true
            };
        };
    };

    if !(isNil QMODULE(vehicle_ramp)) then {
        case "ramp": {
            [_vehicle] call FUNC(vehicle_ramp,toggle);

            true
        };
    };

    if !(isNil QMODULE(vehicle_refuel)) then {
        case "refuel": {
            closeDialog 0;
            
            [_vehicle] spawn FUNC(vehicle_refuel,refuel);

            false
        };
    };

    if !(isNil QMODULE(vehicle_repair)) then {
        case "repair": {
            closeDialog 0;
            
            [_vehicle] spawn FUNC(vehicle_repair,repair);

            false
        };
    };

    if !(isNil QMODULE(vehicle_teleport)) then {
        case "teleport": {
            closeDialog 0;
    
            [_vehicle] call FUNC(teleport,show);

            false
        };
    };

    if !(isNil QMODULE(vehicle_texture)) then {
        case "texture": {
            [_vehicle] call FUNC(vehicle_texture,set);

            true
        };
    };

    if !(isNil QMODULE(vehicle_unflip)) then {
        case "unflip": {
            [_vehicle] call FUNC(vehicle_unflip,unflip);

            true
        };
    };
};

// Refresh dialog for all clients (except actioning player) with it open
[true, "spawn", [[player, _vehicle], {
    private ["_unit", "_vehicle"];
    
    PARAMS_2(_unit, _vehicle);

    if ([_unit, player] call BIS_fnc_areEqual) exitWith {};
    if !([typeName (uiNamespace getVariable "X_VEHICLE_MENU_DIALOG"), "DISPLAY"] call BIS_fnc_areEqual) exitWith {};
    if !([_vehicle, GVAR(vehicle_dialog)] call BIS_fnc_areEqual) exitWith {};

    closeDialog 0;

    [_vehicle] call FUNC(THIS_MODULE,show);
}]] call FUNC(network,mp);

if !(_refresh) exitWith {};

closeDialog 0;

[_vehicle] call FUNC(THIS_MODULE,show);