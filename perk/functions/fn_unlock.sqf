#define THIS_MODULE perk
#include "x_macros.sqf"
private ["_tier", "_perk"];
PARAMS_2(_tier,_perk);

switch (_tier) do {
    case 0: {
        switch (_perk) do {
            case 1: {
                player setVariable [QGVAR(perkMedkitsMax), (player getVariable QGVAR(perkMedkitsMax)) + 1];
                player setVariable [QGVAR(perkMedkits), (player getVariable QGVAR(perkMedkits)) + 1];
            };
            
            case 2: {
                player setVariable [QGVAR(perkRepairKitsMax), (player getVariable QGVAR(perkRepairKitsMax)) + 1];
                player setVariable [QGVAR(perkRepairKits), (player getVariable QGVAR(perkRepairKits)) + 1];
            };
            
            case 3: {
                player setVariable [QGVAR(perkFlyAttackAircraft), true];
            };
            
            case 4: {
                player setVariable [QGVAR(perkAirdrop), true];
            };
            
            case 5: {
                player setVariable [QGVAR(perkSaveLoadout), true];
            };
            
            case 6: {
                player setVariable [QGVAR(perkTeleportMHQ), true];
            };
            
            case 7: {
                player setVariable [QGVAR(perkAmmoboxUnload), 120]; // maybe not a pvar?
            };
            
            case 8: {
                player setVariable [QGVAR(perkHalo), true];
            };
            
            case 9: {
                player setVariable [QGVAR(perkFlip), true];
            };
        };
    };
    case 2: {
        switch (_perk) do {
            case 1: {
                player setVariable [QGVAR(perkRepairKitsMax), (player getVariable QGVAR(perkRepairKitsMax)) + 1];
                player setVariable [QGVAR(perkRepairKits), (player getVariable QGVAR(perkRepairKits)) + 1];
            };
            
            case 2: {
                player setVariable [QGVAR(perkFullRepair), true];
            };
            
            case 4: {
                player setVariable [QGVAR(perkRepairKitsMax), (player getVariable QGVAR(perkRepairKitsMax)) + 1];
                player setVariable [QGVAR(perkRepairKits), (player getVariable QGVAR(perkRepairKits)) + 1];
            };
        };
    };
};