/**
 * Vehicle Marker Module (Handler)
 */

#define THIS_MODULE vehicle_marker
#include "x_macros.sqf"

if (hasInterface) then {
    ["marker_vehicles", {
        if (!visibleMap && {!ctrlVisible 10000}) exitWith {};

        {
            private ["_marker"];

            _marker = [_x] call FUNC(THIS_MODULE,valid);

            if !(isNil "_marker") then {
                private ["_alive", "_distance", "_hidden", "_alpha"];

                _marker setMarkerPosLocal (getPosASL _x);

                _alive = alive _x;
                _distance = _x distance (_x getVariable QGVAR(position)) > GVAR(vehicle_marker_visible);
                _hidden = _x getVariable QGVAR(hidden);

                if ([markerColor _marker, "ColorBlack"] call BIS_fnc_areEqual || {!(_x call FUNC(common,empty))}) then {
                    private ["_sides", "_colors", "_side", "_color"];

                    _sides = [0, GVAR(vehicle_marker_types_side)] call FUNC(common,arrayValues);
                    _colors = [1, GVAR(vehicle_marker_types_side)] call FUNC(common,arrayValues);

                    _side = str (side _x);

                    if (_side in _sides) then {
                        _color = _colors select (_sides find _side);

                        if !(markerColor _marker in [_color, "ColorYellow"]) then {
                            _marker setMarkerColorLocal _color;
                        };
                    };
                };

                _alpha = if (!_hidden && {!_alive || {_alive && {_distance || {{alive _x && {isPlayer _x || {[side _x, east] call BIS_fnc_areEqual}}} count crew _x > 0}}}}) then {
                    if (alive _x && {!canMove _x}) then {0.45} else {1};
                } else {
                    0
                };

                if !([_alpha, markerAlpha _marker] call BIS_fnc_areEqual) then {
                    _marker setMarkerAlphaLocal _alpha;
                };
            };
        } forEach call FUNC(common,vehicles);
    }, 2] call FUNC(client,addPerFrame);
};