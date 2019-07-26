#include "x_macros.sqf"

while {true} do {
    {
        if (side _x in [east, civilian] && {{alive _x} count units _x < 1}) then {
            deleteGroup _x;
        };
    } forEach allGroups;
    
    sleep 10;
};