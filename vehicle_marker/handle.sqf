/**
 * Vehicle Marker Module (Handler)
 */

#define THIS_MODULE vehicle_marker
#include "x_macros.sqf"

if (hasInterface) then {
    ["marker_vehicles", {
        if (!visibleMap && {!ctrlVisible 10000}) exitWith {};

        {
            private ["_marker", "_vehicle"];

            _marker = [_x] call FUNC(THIS_MODULE,valid);

            if !(isNil "_marker") then {
                private ["_vehicle", "_name", "_color", "_alpha"];

                if !([[(getPosASL _x) select 0, (getPosASL _x) select 1, 0], markerPos _marker] call BIS_fnc_areEqual) then {
                    _marker setMarkerPosLocal (getPosASL _x);
                };

                _vehicle = +(_x getVariable QGVAR(marker));

                if !(isNil QMODULE(vehicle_cargo)) then {
                    _vehicle = [_x, _vehicle] __submodulePP(vehicle_cargo);
                };

                if !(isNil QMODULE(vehicle_deploy)) then {
                    _vehicle = [_x, _vehicle] __submodulePP(vehicle_deploy);
                };

                if !(isNil QMODULE(vehicle_wreck)) then {
                    _vehicle = [_x, _vehicle] __submodulePP(vehicle_wreck);
                };

                _name = _vehicle select 0;

                if (count _vehicle > 1) then {
                    _name = _name + format [" (%1)", _vehicle select 1];
                };

                if !([_name, markerText _marker] call BIS_fnc_areEqual) then {
                    _marker setMarkerTextLocal _name;
                };

                switch (true) do {
                    case (count _vehicle > 2): {
                        _color = format ["Color%1", _vehicle select 2];
                    };

                    default {
                        if (markerColor _marker in ["ColorBlack", "ColorYellow"] || {!(_x call FUNC(common,empty))}) exitWith {
                            _color = [side _x] call FUNC(THIS_MODULE,side);
                        };

                        _color = markerColor _marker;
                    };
                };

                if !([_color, markerColor _marker] call BIS_fnc_areEqual) then {
                    _marker setMarkerColorLocal _color;
                };

                _alpha = switch (true) do {
                    case (_x distance (_x getVariable QGVAR(position)) > GVAR(vehicle_marker_visible));
                    case ({alive _x && {isPlayer _x || {[side _x, east] call BIS_fnc_areEqual}}} count crew _x > 0);
                    case (!isNil {_x getVariable QGVAR(cargo)} && {!([count (_x getVariable QGVAR(cargo)), 0] call BIS_fnc_areEqual)}): {
                        if (!isNil QMODULE(vehicle_marker) && {_x getVariable QGVAR(hidden)}) exitWith {
                            0
                        };

                        if (alive _x && {!canMove _x}) then {
                            0.45
                        } else {
                            1
                        };
                    };

                    default {
                        0
                    };
                };

                if !([_alpha, markerAlpha _marker] call BIS_fnc_areEqual) then {
                    _marker setMarkerAlphaLocal _alpha;
                };
            };
        } forEach call FUNC(common,vehicles);
    }, 2] call FUNC(client,addPerFrame);
};