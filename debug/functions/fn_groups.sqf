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

    hintSilent parseText format [
        "<br /><t align='left'>&#160;<t underline='1'>Sides</t></t><t align='right'><t underline='1'>Groups</t>&#160;</t><br /><br />%1<br />%2<br />%3<br /><br />",
        format [
            "<t align='left'><t color='#5398b6'>&#160;WEST</t>: %1/144</t><t align='right'>Observed: %2&#160;</t>",
            {[side _x, west] call BIS_fnc_areEqual} count allGroups,
            count (X_JIP getVariable QGVAR(groups))
        ],
        format [
            "<t align='left'><t color='#c54a30'>&#160;EAST</t>: %1/144</t><t align='right'>Total: %2&#160;</t>",
            {[side _x, east] call BIS_fnc_areEqual} count allGroups,
            count allGroups
        ],
        format [
            "<t align='left'><t color='#f0bfbfbf'>&#160;CIV</t>: %1/144</t>",
            {[side _x, civilian] call BIS_fnc_areEqual} count allGroups
        ]
    ];

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