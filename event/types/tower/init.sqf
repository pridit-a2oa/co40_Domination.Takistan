/**
 * Event - Tower Module
 *
 * Description: This module is responsible for handling the event
 * to create TK occupied communication towers with AA.
 */

#define THIS_MODULE event_tower
#include "x_macros.sqf"

if !(isServer) exitWith {};

// Add to the list of possible types of events
[GVAR(event_types), "Tower"] call BIS_fnc_arrayPush;

// Set minimum number of events of this type to exist
GVAR(event_tower_amount) = 2;

// Set composition of the event
GVAR(event_tower_composition) = "AntiAir1_TK_EP1";

// Set possible positions to generate the event at
GVAR(event_tower_positions) = [
    [[-112.213,9524.68,0], random 360],
    [[1029.54,4594.24,0], random 360],
    [[2268.7,8594.85,0], random 360],
    [[2634.34,4084.24,0], random 360],
    [[2657.21,3852.52,0], random 360],
    [[3129.69,11815,0], random 360],
    [[3251.33,1356.75,0], random 360],
    [[3609.56,1905.61,0], random 360],
    [[3905.07,6887.76,0], random 360],
    [[5088.56,2666.48,0], random 360],
    [[5728.15,4094.09,0], random 360],
    [[5934.88,5056.68,0], random 360],
    [[6172.33,3699.6,0], random 360],
    [[6578.21,6793.1,0], random 360],
    [[6935.34,5360.3,0], random 360],
    [[7775.62,5299.46,0], random 360],
    [[9439.07,5694.56,0], random 360],
    [[11056.2,7070.5,0], random 360],
    [[11508.5,4465.03,0], random 360],
    [[12503.6,8062.73,0], random 360]
];

__cppfln(FUNC(THIS_MODULE,create),event\types\tower\functions\fn_create.sqf);

MODULE(THIS_MODULE) = true;