#define THIS_MODULE debug
#include "x_macros.sqf"

while {[GVAR(debug_groups), 1] call BIS_fnc_areEqual} do {
    {
        deleteMarkerLocal _x;
    } forEach GVAR(debug_markers);

    GVAR(debug_markers) resize 0;

    {
        private ["_id", "_color"];

        _id = _forEachIndex;
        _color = [
            "Red",
            "Green",
            "Blue",
            "Yellow",
            "Orange",
            "Pink",
            "Brown",
            "Khaki"
        ] call BIS_fnc_selectRandom;

        {
            private ["_name", "_marker"];

            _name = format ["debug%1%2", str _x, _forEachIndex];
            
            _marker = createMarkerLocal [_name, position _x];
            _marker setMarkerTypeLocal "DOT";
            _marker setMarkerTextLocal (str _id);
            _marker setMarkerColorLocal (format ["Color%1", _color]);

            [GVAR(debug_markers), _name] call BIS_fnc_arrayPush;
        } forEach units _x;
    } forEach allGroups;

    systemChat format ["DEBUG: %1", count allGroups];

    sleep 5;
};

{
    deleteMarkerLocal _x;
} forEach GVAR(debug_markers);

GVAR(debug_markers) resize 0;

waitUntil {
    sleep 5;

    [GVAR(debug_groups), 1] call BIS_fnc_areEqual
};

0 spawn FUNC(THIS_MODULE,groups);