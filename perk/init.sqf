/**
 * Perk Module
 *
 * Description: Player reward system based on score accrued.
 */

#define THIS_MODULE perk
#include "x_macros.sqf"

// Role restrictions for role-based perks
GVAR(perk_type_roles) = [
    [GVAR(artillery),       [1]],
    [GVAR(engineers),       [2]],
    [GVAR(machine_gunners), [3]],
    [GVAR(marksman),        [4]],
    [GVAR(medics),          [5]],
    [GVAR(pilots),          [6]]
];

// Increments of points rewarded
GVAR(perk_amount_points) = 2;

// Increments of score required
GVAR(perk_amount_score) = 15;

if (hasInterface) then {
    if (isNil {player getVariable QGVAR(perk_points)}) then {
        player setVariable [QGVAR(perk_points), 1];
    };
    
    if (isNil {player getVariable QGVAR(perk_ids)}) then {
        player setVariable [QGVAR(perk_ids), []];
        player setVariable [QGVAR(perks_unlocked), []];
    };
};

__cppfln(FUNC(THIS_MODULE,awarded),THIS_MODULE\functions\fn_awarded.sqf);
__cppfln(FUNC(THIS_MODULE,calculate),THIS_MODULE\functions\fn_calculate.sqf);
__cppfln(FUNC(THIS_MODULE,clicked),THIS_MODULE\functions\fn_clicked.sqf);
__cppfln(FUNC(THIS_MODULE,reset),THIS_MODULE\functions\fn_reset.sqf);
__cppfln(FUNC(THIS_MODULE,show),THIS_MODULE\functions\fn_show.sqf);
__cppfln(FUNC(THIS_MODULE,unlock),THIS_MODULE\functions\fn_unlock.sqf);

MODULE(THIS_MODULE) = true;