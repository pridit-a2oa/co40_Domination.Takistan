#define THIS_MODULE perk
#include "x_macros.sqf"
private ["_tier", "_perk"];

PARAMS_2(_tier, _perk);

switch (_tier) do {
    case 0: {
        switch (_perk) do {
            case 1: {
                if (!isNil QMODULE(medical)) then {
                    player setVariable [QGVAR(medkits), (player getVariable QGVAR(medkits)) + 1, true];
                    player setVariable [QGVAR(medkits_max), (player getVariable QGVAR(medkits_max)) + 1, true];
                };
            };
            
            case 2: {
                if (!isNil QMODULE(vehicle_repair)) then {
                    player setVariable [QGVAR(repair_kits), (player getVariable QGVAR(repair_kits)) + 1, true];
                    player setVariable [QGVAR(repair_kits_max), (player getVariable QGVAR(repair_kits_max)) + 1, true];
                };
            };
            
            case 3: {
                if (!isNil QMODULE(vehicle_bonus)) then {
                    player setVariable [QGVAR(pilot), true];
                };
            };
            
            case 4: {
                if (!isNil QMODULE(halo)) then {
                    player setVariable [QGVAR(halo), true];
                };
            };
            
            case 5: {
                if (!isNil QMODULE(airdrop)) then {
                    player setVariable [QGVAR(airdrop), true];
                    
                    if (!isNil QMODULE(communication)) then {
                        [
                            BIS_MENU_Radio,
                            "Airdrop",
                            "CursorOnGround",
                            "[player, screenToWorld [0.5, 0.5]] execVM 'airdrop\functions\fn_call.sqf'",
                            "\ca\ui\data\cursor_tactical_ca"
                        ] call FUNC(communication,add);
                    };
                };
            };
            
            case 6: {
                if (!isNil QMODULE(vehicle_teleport)) then {
                    player setVariable [QGVAR(teleport), true];
                };
            };
            
            case 7: {
                if (!isNil QMODULE(backpack)) then {
                    player setVariable [QGVAR(backpack), true];
                };
            };
            
            case 8: {
                if (!isNil QMODULE(loadout)) then {
                    player setVariable [QGVAR(loadout), true];
                    
                    systemChat "To save a loadout use the context option on an ammobox";
                };
            };
            
            case 9: {
                if (!isNil QMODULE(vehicle_flip)) then {
                    player setVariable [QGVAR(flip), true];
                };
            };
        };
    };
    
    case 1: {
        switch (_perk) do {
            case 1: {
                if (!isNil QMODULE(artillery)) then {
                    player setVariable [QGVAR(artillery), true];
                    player setVariable [QGVAR(artillery_salvoes), 1];
                    
                    if (!isNil QMODULE(communication)) then {
                        [
                            BIS_MENU_Radio,
                            "Artillery Strike",
                            "CursorOnGround",
                            "0 = [player, screenToWorld [0.5, 0.5], player getVariable 'd_artillery_salvoes'] execVM 'artillery\functions\fn_call.sqf'",
                            "\ca\ui\data\cursor_attack_ca"
                        ] call FUNC(communication,add);
                    };
                };
            };
            
            case 2: {
                if (!isNil QMODULE(artillery)) then {
                    player setVariable [QGVAR(artillery_salvoes), (player getVariable QGVAR(artillery_salvoes)) + 1];
                };
            };
            
            case 3: {
                if (!isNil QMODULE(artillery)) then {
                    player setVariable [QGVAR(artillery_range), GVAR(artillery_distance_range) + 1000];
                };
            };
            
            case 4: {
                if (!isNil QMODULE(artillery)) then {
                    GVAR(artillery_time_cooldown) = GVAR(artillery_time_cooldown) - 300;
                    
                    player setVariable [QGVAR(artillery_cooldown), (player getVariable QGVAR(artillery_cooldown)) - 300];
                };
            };
            
            case 5: {
                if (!isNil QMODULE(artillery)) then {
                    player setVariable [QGVAR(artillery_salvoes), (player getVariable QGVAR(artillery_salvoes)) + 1];
                };
            };
        };
    };
    
    case 2: {
        switch (_perk) do {
            case 1: {
                if (!isNil QMODULE(ied)) then {
                    player setVariable [QGVAR(ied), true];
                };
            };
            
            case 2: {
                if (!isNil QMODULE(vehicle_repair)) then {
                    player setVariable [QGVAR(repair_kits), (player getVariable QGVAR(repair_kits)) + 1, true];
                    player setVariable [QGVAR(repair_kits_max), (player getVariable QGVAR(repair_kits_max)) + 1, true];
                };
            };
            
            case 3: {
                if (!isNil QMODULE(farp)) then {
                    player setVariable [QGVAR(farp), 1];
                    player setVariable [QGVAR(farp_max), 1];
                    
                    if (!isNil QMODULE(communication) && {!isNil QMODULE(construction)}) then {
                        [
                            BIS_MENU_Construct,
                            "FARP",
                            "",
                            "0 = ['FARP'] execVM 'construction\functions\fn_create.sqf'"
                        ] call FUNC(communication,add);
                    };
                };
            };
            
            case 4: {
                if (!isNil QMODULE(vehicle_repair)) then {
                    player setVariable [QGVAR(repair_full), true];
                };
            };
            
            case 5: {
                if (!isNil QMODULE(vehicle_repair)) then {
                    player setVariable [QGVAR(repair_kits), (player getVariable QGVAR(repair_kits)) + 1, true];
                    player setVariable [QGVAR(repair_kits_max), (player getVariable QGVAR(repair_kits_max)) + 1, true];
                };
            };
        };
    };
    
    case 3: {
        switch (_perk) do {
            case 1: {
                if (!isNil QMODULE(nest)) then {
                    player setVariable [QGVAR(nest), 1];
                    player setVariable [QGVAR(nest_max), 1];
                    
                    if (!isNil QMODULE(communication) && {!isNil QMODULE(construction)}) then {
                        [
                            BIS_MENU_Construct,
                            "MG Nest",
                            "",
                            "0 = ['Nest'] execVM 'construction\functions\fn_create.sqf'"
                        ] call FUNC(communication,add);
                    };
                };
            };
            
            case 2: {
                if (!isNil QMODULE(nest)) then {
                    player setVariable [QGVAR(nest), (player getVariable QGVAR(nest)) + 1];
                    player setVariable [QGVAR(nest_max), (player getVariable QGVAR(nest_max)) + 1];
                };
            };
            
            case 3: {
                if (!isNil QMODULE(nest)) then {
                    GVAR(nest_cooldown) = GVAR(nest_cooldown) - 300;
                    
                    player setVariable [QGVAR(nest_cooldown), (player getVariable QGVAR(nest_cooldown)) - 300];
                };
            };
            
            case 4: {
                if (!isNil QMODULE(nest)) then {
                    player setVariable [QGVAR(nest), (player getVariable QGVAR(nest)) + 1];
                    player setVariable [QGVAR(nest_max), (player getVariable QGVAR(nest_max)) + 1];
                };
            };
            
            case 5: {
                if (!isNil QMODULE(airdrop)) then {
                    GVAR(airdrop_time_cooldown) = GVAR(airdrop_time_cooldown) + 1200;
                    
                    player setVariable [QGVAR(airdrop_types), (player getVariable QGVAR(airdrop_types)) + [["M1A1", "M1A1_US_DES_EP1"]]];
                    
                    if (!isNil QMODULE(setting)) then {
                        ["airdrop_type"] call FUNC(setting,update);
                    };
                };
            };
        };
    };
    
    case 4: {
        switch (_perk) do {
            case 1: {
                if (!isNil QMODULE(fortification)) then {
                    player setVariable [QGVAR(fortification), 1];
                    player setVariable [QGVAR(fortification_max), 1];
                    
                    if (!isNil QMODULE(communication) && {!isNil QMODULE(construction)}) then {
                        [
                            BIS_MENU_Construct,
                            "Fortification",
                            "",
                            "0 = ['Fortification'] execVM 'construction\functions\fn_create.sqf'"
                        ] call FUNC(communication,add);
                    };
                };
            };
            
            case 2: {
                if (!isNil QMODULE(fortification)) then {
                    player setVariable [QGVAR(fortification), (player getVariable QGVAR(fortification)) + 1];
                    player setVariable [QGVAR(fortification_max), (player getVariable QGVAR(fortification_max)) + 1];
                };
            };
            
            case 3: {
                if (!isNil QMODULE(fortification)) then {
                    GVAR(fortification_cooldown) = GVAR(fortification_cooldown) - 300;
                    
                    player setVariable [QGVAR(fortification_cooldown), (player getVariable QGVAR(fortification_cooldown)) - 300];
                };
            };
            
            case 4: {
                if (!isNil QMODULE(fortification)) then {
                    player setVariable [QGVAR(fortification), (player getVariable QGVAR(fortification)) + 1];
                    player setVariable [QGVAR(fortification_max), (player getVariable QGVAR(fortification_max)) + 1];
                };
            };
            
            case 5: {
                if (!isNil QMODULE(airdrop)) then {
                    GVAR(airdrop_time_cooldown) = GVAR(airdrop_time_cooldown) + 600;
                    
                    player setVariable [QGVAR(airdrop_types), (player getVariable QGVAR(airdrop_types)) + [["M2A2", "M2A2_EP1"]]];
                    
                    if (!isNil QMODULE(setting)) then {
                        ["airdrop_type"] call FUNC(setting,update);
                    };
                };
            };
        };
    };
    
    case 5: {
        switch (_perk) do {
            case 1: {
                if (!isNil QMODULE(mash)) then {
                    player setVariable [QGVAR(mash), 1];
                    player setVariable [QGVAR(mash_max), 1];
                    
                    if (!isNil QMODULE(communication) && {!isNil QMODULE(construction)}) then {
                        [
                            BIS_MENU_Construct,
                            "MASH",
                            "",
                            "0 = ['MASH'] execVM 'construction\functions\fn_create.sqf'"
                        ] call FUNC(communication,add);
                    };
                };
            };
            
            case 2: {
                if (!isNil QMODULE(medical)) then {
                    player setVariable [QGVAR(medkits), (player getVariable QGVAR(medkits)) + 1, true];
                    player setVariable [QGVAR(medkits_max), (player getVariable QGVAR(medkits_max)) + 1, true];
                };
            };
            
            case 3: {
                if (!isNil QMODULE(medical)) then {
                    player setVariable [QGVAR(revive_damage), 0];
                };
            };
            
            case 4: {
                if (!isNil QMODULE(mash)) then {
                    player setVariable [QGVAR(mash), (player getVariable QGVAR(mash)) + 1];
                    player setVariable [QGVAR(mash_max), (player getVariable QGVAR(mash_max)) + 1];
                };
            };
            
            case 5: {
                if (!isNil QMODULE(medical)) then {
                    player setVariable [QGVAR(medkits), (player getVariable QGVAR(medkits)) + 1, true];
                    player setVariable [QGVAR(medkits_max), (player getVariable QGVAR(medkits_max)) + 1, true];
                };
            };
        };
    };
    
    case 6: {
        switch (_perk) do {
            case 1: {
                if (!isNil QMODULE(uav)) then {
                    player setVariable [QGVAR(uav), true];
                    
                    if (!isNil QMODULE(communication)) then {
                        [
                            BIS_MENU_Radio,
                            "UAV",
                            "CursorOnGround",
                            "0 = [player, screenToWorld [0.5, 0.5]] execVM 'uav\functions\fn_call.sqf'",
                            "\ca\ui\data\cursor_support_ca"
                        ] call FUNC(communication,add);
                    };
                };
            };
            
            case 2: {
                if (!isNil QMODULE(airtaxi)) then {
                    player setVariable [QGVAR(air_taxi), true];
                    
                    if (!isNil QMODULE(communication)) then {
                        [
                            BIS_MENU_Radio,
                            "Air Taxi",
                            "CursorOnGround",
                            "0 = [player, screenToWorld [0.5, 0.5]] execVM 'airtaxi\functions\fn_call.sqf'",
                            "\ca\ui\data\cursor_getin_ca"
                        ] call FUNC(communication,add);
                    };
                };
            };
            
            case 3: {
                if (!isNil QMODULE(vehicle_load)) then {
                    player setVariable [QGVAR(vehicle_load), 1];
                };
            };
            
            case 4: {
                if (!isNil QMODULE(vehicle_load)) then {
                    player setVariable [QGVAR(vehicle_load), (player getVariable QGVAR(vehicle_load)) + 1];
                };
            };
            
            case 5: {
                if (!isNil QMODULE(airdrop)) then {
                    GVAR(airdrop_time_cooldown) = GVAR(airdrop_time_cooldown) + 600;
                    
                    player setVariable [QGVAR(airdrop_types), (player getVariable QGVAR(airdrop_types)) + [["AH6J", "AH6J_EP1"]]];
                    
                    if (!isNil QMODULE(setting)) then {
                        ["airdrop_type"] call FUNC(setting,update);
                    };
                };
            };
        };
    };
};