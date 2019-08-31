#include "x_macros.sqf"

{
    if ((faction _x) in ["BIS_TK", "BIS_TK_INS"]) then {
        _x setDamage 1;
    };
} forEach allUnits;

{
    deleteMarker _x;
} forEach GVAR(markers);

_colors = [
    "Red", "Green", "Blue", "Yellow", "Orange", "Pink", "Brown", "Khaki"
];

{
    _id = _forEachIndex;
    _color = _colors call BIS_fnc_selectRandom;
    
    {
        _name = format ["marker%1%2", str _x, _forEachIndex];
        
        _marker = createMarker [_name, position _x];
        _marker setMarkerType "DOT";
        _marker setMarkerText (str _id);
        _marker setMarkerColor (format ["Color%1", _color]);
        
        GVAR(markers) = GVAR(markers) + [_name];
    } forEach (units _x);
} forEach allGroups;

count allGroups