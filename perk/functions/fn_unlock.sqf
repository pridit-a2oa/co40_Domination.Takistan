#define THIS_MODULE perk
#include "x_macros.sqf"
private ["_tier", "_perk", "_original"];

PARAMS_3(_tier, _perk, _original);

switch (_tier) do {
    case 0: {
        switch (_perk) do {
            case 1: {
                if !(isNil QMODULE(inventory) && {isNil QMODULE(inventory_medical)}) then {
                    player setVariable [QGVAR(inventory_medical), (player getVariable QGVAR(inventory_medical)) + 1, true];
                    player setVariable [QGVAR(inventory_medical_max), (player getVariable QGVAR(inventory_medical_max)) + 1, true];
                };
            };

            case 2: {
                if !(isNil QMODULE(inventory) && {isNil QMODULE(inventory_repair)}) then {
                    player setVariable [QGVAR(inventory_repair), (player getVariable QGVAR(inventory_repair)) + 1, true];
                    player setVariable [QGVAR(inventory_repair_max), (player getVariable QGVAR(inventory_repair_max)) + 1, true];
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
                            "CursorOnGround * PlayerOwnRadio",
                            "[player, screenToWorld [0.5, 0.5], getPlayerUID player] execVM 'airdrop\functions\fn_call.sqf'",
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
                if !(isNil QMODULE(damage)) then {
                    player setVariable [QGVAR(damage_vehicle), 0.75, true];
                };
            };

            case 8: {
                if (!isNil QMODULE(backpack)) then {
                    player setVariable [QGVAR(backpack), true];
                };
            };

            case 9: {
                if (!isNil QMODULE(loadout)) then {
                    player setVariable [QGVAR(loadout), true];
                };
            };

            case 10: {
                if (!isNil QMODULE(vehicle_unflip)) then {
                    player setVariable [QGVAR(unflip), true];
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
                            "CursorOnGround * PlayerOwnRadio",
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
                if (!isNil QMODULE(construction) && {!isNil QMODULE(construction_farp)}) then {
                    player setVariable [QGVAR(construction_farp), 1];
                    player setVariable [QGVAR(construction_farp_max), 1];

                    if (!isNil QMODULE(communication)) then {
                        [
                            BIS_MENU_Construct,
                            "FARP",
                            "",
                            "0 = ['FARP'] execVM 'construction\functions\fn_create.sqf'"
                        ] call FUNC(communication,add);
                    };
                };
            };

            case 2: {
                if !(isNil QMODULE(inventory) && {isNil QMODULE(inventory_repair)}) then {
                    player setVariable [QGVAR(inventory_repair), (player getVariable QGVAR(inventory_repair)) + 1, true];
                    player setVariable [QGVAR(inventory_repair_max), (player getVariable QGVAR(inventory_repair_max)) + 1, true];
                };
            };

            case 3: {
                if (!isNil QMODULE(vehicle_repair)) then {
                    player setVariable [QGVAR(repair_full), true];
                };
            };

            case 4: {
                if (!isNil QMODULE(ied)) then {
                    player setVariable [QGVAR(ied), true, true];
                };
            };

            case 5: {
                if (!isNil QMODULE(vehicle_upgrade)) then {
                    player setVariable [QGVAR(vehicle_upgrade_types), (player getVariable QGVAR(vehicle_upgrade_types)) + [
                        ["(Perk) MC", "M1129_MC_EP1"],
                        ["(Perk) MGS", "M1128_MGS_EP1"],
                        ["(Perk) TOW", "M1135_ATGMV_EP1"]
                    ]];

                    if (!isNil QMODULE(setting)) then {
                        ["vehicle_upgrade_type", false] call FUNC(setting,update);
                    };
                };
            };
        };
    };

    case 3: {
        switch (_perk) do {
            case 1: {
                if (!isNil QMODULE(construction) && {!isNil QMODULE(construction_nest)}) then {
                    player setVariable [QGVAR(construction_nest), 1];
                    player setVariable [QGVAR(construction_nest_max), 1];

                    if (!isNil QMODULE(communication)) then {
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
                if (!isNil QMODULE(construction) && {!isNil QMODULE(construction_nest)}) then {
                    GVAR(construction_nest_time_cooldown) = GVAR(construction_nest_time_cooldown) - 300;
                };
            };

            case 3: {
                if (!isNil QMODULE(construction) && {!isNil QMODULE(construction_nest)}) then {
                    player setVariable [QGVAR(nest_ammo), 1];
                };
            };

            case 4: {
                if (!isNil QMODULE(construction) && {!isNil QMODULE(construction_nest)}) then {
                    player setVariable [QGVAR(construction_nest), (player getVariable QGVAR(construction_nest)) + 1];
                    player setVariable [QGVAR(construction_nest_max), (player getVariable QGVAR(construction_nest_max)) + 1];
                };
            };

            case 5: {
                if (!isNil QMODULE(airdrop)) then {
                    ["M1A2_US_TUSK_MG_EP1", _original] call FUNC(airdrop,add);
                };
            };
        };
    };

    case 4: {
        switch (_perk) do {
            case 1: {
                if (!isNil QMODULE(construction) && {!isNil QMODULE(construction_fortification)}) then {
                    player setVariable [QGVAR(construction_fortification), 1];
                    player setVariable [QGVAR(construction_fortification_max), 1];

                    if (!isNil QMODULE(communication)) then {
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
                if (!isNil QMODULE(construction) && {!isNil QMODULE(construction_fortification)}) then {
                    GVAR(construction_fortification_time_cooldown) = GVAR(construction_fortification_time_cooldown) - 300;
                };
            };

            case 3: {
                if (!isNil QMODULE(construction) && {!isNil QMODULE(construction_fortification)}) then {
                    player setVariable [QGVAR(fortification_types), (player getVariable QGVAR(fortification_types)) + [
                        ["(Perk) Bunker", "Land_fortified_nest_small_EP1"],
                        ["(Perk) Rampart", "Land_fort_rampart_EP1"]
                    ]];

                    if (!isNil QMODULE(setting)) then {
                        ["fortification_type", false] call FUNC(setting,update);
                    };
                };
            };

            case 4: {
                if (!isNil QMODULE(construction) && {!isNil QMODULE(construction_fortification)}) then {
                    player setVariable [QGVAR(construction_fortification), (player getVariable QGVAR(construction_fortification)) + 1];
                    player setVariable [QGVAR(construction_fortification_max), (player getVariable QGVAR(construction_fortification_max)) + 1];
                };
            };

            case 5: {
                if (!isNil QMODULE(airdrop)) then {
                    ["M2A2_EP1", _original] call FUNC(airdrop,add);
                };
            };
        };
    };

    case 5: {
        switch (_perk) do {
            case 1: {
                if (!isNil QMODULE(construction) && {!isNil QMODULE(construction_mash)}) then {
                    player setVariable [QGVAR(construction_mash), 1];
                    player setVariable [QGVAR(construction_mash_max), 1];

                    if (!isNil QMODULE(communication)) then {
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
                if !(isNil QMODULE(inventory) && {isNil QMODULE(inventory_medical)}) then {
                    player setVariable [QGVAR(inventory_medical), (player getVariable QGVAR(inventory_medical)) + 1, true];
                    player setVariable [QGVAR(inventory_medical_max), (player getVariable QGVAR(inventory_medical_max)) + 1, true];
                };
            };

            case 3: {
                if !(isNil QMODULE(damage)) then {
                    player setVariable [QGVAR(damage_man), 0.4];
                };
            };

            case 4: {
                if (!isNil QMODULE(construction) && {!isNil QMODULE(construction_mash)}) then {
                    player setVariable [QGVAR(construction_mash), (player getVariable QGVAR(construction_mash)) + 1];
                    player setVariable [QGVAR(construction_mash_max), (player getVariable QGVAR(construction_mash_max)) + 1];
                };
            };

            case 5: {
                if !(isNil QMODULE(inventory) && {isNil QMODULE(inventory_medical)}) then {
                    player setVariable [QGVAR(inventory_medical), (player getVariable QGVAR(inventory_medical)) + 1, true];
                    player setVariable [QGVAR(inventory_medical_max), (player getVariable QGVAR(inventory_medical_max)) + 1, true];
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
                            "CursorOnGround * PlayerOwnRadio",
                            "0 = [player, screenToWorld [0.5, 0.5], player getVariable 'd_uav_radius'] execVM 'uav\functions\fn_call.sqf'",
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
                            "CursorOnGround * PlayerOwnRadio",
                            "0 = [player, screenToWorld [0.5, 0.5]] execVM 'airtaxi\functions\fn_call.sqf'",
                            "\ca\ui\data\cursor_getin_ca"
                        ] call FUNC(communication,add);
                    };
                };
            };

            case 3: {
                if (!isNil QMODULE(uav)) then {
                    GVAR(uav_time_cooldown) = GVAR(uav_time_cooldown) - 300;
                };
            };

            case 4: {
                if (!isNil QMODULE(uav)) then {
                    player setVariable [QGVAR(uav_radius), GVAR(uav_distance_scan) + 200];
                };
            };

            case 5: {
                if (!isNil QMODULE(airdrop)) then {
                    ["AH6J_EP1", _original] call FUNC(airdrop,add);
                };
            };
        };
    };
};