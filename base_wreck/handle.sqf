/**
 * Base Wreck Module (Handler)
 */

#define THIS_MODULE base_wreck
#include "x_macros.sqf"

if (isServer) then {
    private ["_marker", "_position", "_hangar", "_trigger"];
    
    for "_i" from 1 to GVAR(base_wreck_amount_hangar) do {
        _marker = format [QGVAR(wreck_hangar_%1), _i];
        _position = markerPos _marker;
        
        if (str _position == "[0,0,0]") exitWith {};
        
        _hangar = createVehicle [GVAR(base_wreck_type_hangar), _position, [], 0, "NONE"];
        _hangar setDir (markerDir _marker);
        
        {
            "ClutterCutter_EP1" createVehicle _x;
        } forEach [
            _hangar modelToWorld [0, -36, 0],
            _hangar modelToWorld [0, 20, 0],
            _hangar modelToWorld [0, -20, 0],
            _hangar modelToWorld [14, 20, 0],
            _hangar modelToWorld [-14, 20, 0],
            _hangar modelToWorld [14, -20, 0],
            _hangar modelToWorld [-14, -20, 0],
            _hangar modelToWorld [14, 0, 0],
            _hangar modelToWorld [-14, 0, 0]
        ];
        
        X_JIPH setVariable [QGVAR(wreck_hangars), (X_JIPH getVariable QGVAR(wreck_hangars)) + [_hangar], true];
        
        _trigger = createTrigger ["EmptyDetector", markerPos _marker];
        _trigger setTriggerArea [12, 20, -30, true];
        _trigger setTriggerActivation ["ANY", "PRESENT", true];
        _trigger setTriggerStatements [
            "{typeOf _x != 'ATV_US_EP1'} count thisList > 0",
            "d_wreck_hangars_occupied = d_wreck_hangars_occupied + 1",
            "d_wreck_hangars_occupied = d_wreck_hangars_occupied - 1"
        ];
        
        GVAR(wreck_hangar_triggers) = GVAR(wreck_hangar_triggers) + [_trigger];
    };
    
    {
        GVAR(vehicle_wreck_types) = GVAR(vehicle_wreck_types) + [_x select 1];
    } forEach GVAR(base_wreck_time_rebuild);
    
    _trigger = createTrigger ["EmptyDetector", position GVAR(base_wreck)];
    _trigger setTriggerArea [8, 8, 0, false];
    _trigger setTriggerActivation ["ANY", "PRESENT", true];
    _trigger setTriggerStatements [
        "call d_fnc_base_wreck_valid",
        "0 = [d_rebuild] spawn d_fnc_base_wreck_service",
        ""
    ];
};

if (hasInterface) then {
    private ["_name", "_position", "_marker"];

    waitUntil {sleep 0.1; [count (X_JIPH getVariable QGVAR(wreck_hangars)), GVAR(base_wreck_amount_hangar)] call BIS_fnc_areEqual};
    
    _name = "Wreck Rebuild";
    _position = position GVAR(base_wreck);
    
    _marker = createMarkerLocal ["wreck_rebuild", _position];
    _marker setMarkerTextLocal _name;
    _marker setMarkerColorLocal "ColorBrown";
    _marker setMarkerShapeLocal "ICON";
    _marker setMarkerTypeLocal "DOT";

    {
        {
            if ([str _x, "b_amygdalusn1s_ep1"] call KRON_StrInStr || [str _x, "b_pistacial1s_ep1"] call KRON_StrInStr) then {
                _x setDamage 1;
            };
        } forEach (nearestObjects [_x, [], 50]);
    } forEach (X_JIPH getVariable QGVAR(wreck_hangars));
    
    if (!isNil QMODULE(3d)) then {
        [
            GVAR(base_wreck),
            format ["%1<br /><t color='#f0bfbfbf' size='0.6'>Reconstruct destroyed vehicles</t>", _name call FUNC(common,BrownText)],
            [],
            true,
            true
        ] spawn FUNC(3d,create);
    };
};