/**
 * Perimeter Module (Handler)
 */

#include "x_macros.sqf"
private ["_size", "_width", "_adjust", "_x", "_y", "_zones", "_zone", "_trigger"];

if (hasInterface) then {
    _size = GVAR(perimeter_distance_center);
    _width = GVAR(perimeter_amount_width);
    _adjust = GVAR(perimeter_amount_adjust);

    _x = (markerPos QGVAR(map_zone)) select 0;
    _y = (markerPos QGVAR(map_zone)) select 1;

    _zones = [];

    for "_i" from 1 to 2 do {
        _zone = createMarkerLocal [
            format ["PerimeterAxisY%1", _i],
            [
                if ([_i % 2, 0] call BIS_fnc_areEqual) then {
                    _y + _size + _adjust
                } else {
                    _y - _size + _adjust
                },
                _x - _adjust
            ]
        ];

        _zone setMarkerSizeLocal [_width, _size + _width];

        _zones = _zones + [_zone];
    };

    for "_i" from 1 to 2 do {
        _zone = createMarkerLocal [
            format ["PerimeterAxisX%1", _i],
            [
                _y + _adjust,
                if ([_i % 2, 0] call BIS_fnc_areEqual) then {
                    _x + _size - _adjust
                } else {
                    _x - _size - _adjust
                }
            ]
        ];

        _zone setMarkerSizeLocal [_size - _width, _width];

        _zones = _zones + [_zone];
    };

    {
        _x setMarkerAlphaLocal 0.3;
        _x setMarkerBrushLocal "DiagGrid";
        _x setMarkerColorLocal "ColorRed";
        _x setMarkerShapeLocal "RECTANGLE";
    } forEach _zones;

    _trigger = createTrigger ["EmptyDetector", markerPos QGVAR(map_zone)];
    _trigger setTriggerArea [9000, 9000, 0, true];
    _trigger setTriggerActivation ["ANY", "PRESENT", true];
    _trigger setTriggerStatements [
        "!(player in thisList) && {!((vehicle player) in thisList) && {alive player && {!(player getVariable 'd_unconscious') && {!(typeOf (vehicle player) in [""Parachute_US_EP1"", ""ParachuteWest""])}}}}",
        "[thisTrigger] spawn d_fnc_perimeter_outside",
        ""
    ];
};