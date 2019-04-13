#define THIS_MODULE perk
#include "x_macros.sqf"
private ["_tier", "_perk"];
PARAMS_2(_tier,_perk);

switch (_tier) do {
    case 0: {
        switch (_perk) do {
            case 1: {
                player setVariable [QGVAR(perkMedkitsMax), (player getVariable QGVAR(perkMedkitsMax)) + 1, true];
                player setVariable [QGVAR(perkMedkits), (player getVariable QGVAR(perkMedkits)) + 1, true];
            };
            
            case 2: {
                player setVariable [QGVAR(perkRepairKitsMax), (player getVariable QGVAR(perkRepairKitsMax)) + 1, true];
                player setVariable [QGVAR(perkRepairKits), (player getVariable QGVAR(perkRepairKits)) + 1, true];
            };
            
            case 3: {
                player setVariable [QGVAR(perkFlyAttackAircraft), true];
            };
            
            case 4: {
                player setVariable [QGVAR(perkAirdrop), true];
                
                hintC "To call an airdrop use the radio menu, this can be accessed through the following key combination: 0-0-1";
            };
            
            case 5: {
                player setVariable [QGVAR(perkBackpack), true];
            };
            
            case 6: {
                player setVariable [QGVAR(perkTeleportMHQ), true];
            };
            
            case 7: {
                player setVariable [QGVAR(perkSaveLoadout), true];
            };
            
            case 8: {
                player setVariable [QGVAR(perkHalo), true];
            };
            
            case 9: {
                player setVariable [QGVAR(perkFlip), true];
            };
        };
    };
    case 1: {
        switch (_perk) do {
            case 1: {
                player setVariable [QGVAR(perkAirstrikeSalvoes), 1];
                
                hintC "To call in an airstrike use the radio menu, this can be accessed through the following key combination: 0-0-2";
            };
        };
    };
    case 2: {
        switch (_perk) do {
            case 1: {
                player setVariable [QGVAR(perkRepairKitsMax), (player getVariable QGVAR(perkRepairKitsMax)) + 1, true];
                player setVariable [QGVAR(perkRepairKits), (player getVariable QGVAR(perkRepairKits)) + 1, true];
            };
            
            case 2: {
                player setVariable [QGVAR(perkFullRepair), true];
            };
            
            case 4: {
                player setVariable [QGVAR(perkRepairKitsMax), (player getVariable QGVAR(perkRepairKitsMax)) + 1, true];
                player setVariable [QGVAR(perkRepairKits), (player getVariable QGVAR(perkRepairKits)) + 1, true];
            };
        };
    };
    case 5: {
        switch (_perk) do {
            case 2: {
                player setVariable [QGVAR(perkMedkitsMax), (player getVariable QGVAR(perkMedkitsMax)) + 1, true];
                player setVariable [QGVAR(perkMedkits), (player getVariable QGVAR(perkMedkits)) + 1, true];
            };
            
            case 3: {
                player setVariable [QGVAR(perkGiveMedkitsMax), 2];
            };
            
            case 5: {
                player setVariable [QGVAR(perkMedkitsMax), (player getVariable QGVAR(perkMedkitsMax)) + 1, true];
                player setVariable [QGVAR(perkMedkits), (player getVariable QGVAR(perkMedkits)) + 1, true];
            };
        };
    };
    case 6: {
        switch (_perk) do {
            case 1: {
                player setVariable [QGVAR(perkAirTaxi), true];
                
                hintC "To call an air taxi use the radio menu, this can be accessed through the following key combination: 0-0-3";
            };
        };
    }
};