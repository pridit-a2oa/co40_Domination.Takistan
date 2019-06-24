#include "x_macros.sqf"

while {true} do {
    {
        if (side _x == east && {{alive _x} count units _x < 1}) then {
            deleteGroup _x;
        };
    } forEach allGroups;
    
    sleep 10;
};