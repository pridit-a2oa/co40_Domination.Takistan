/**
 * Base Module (Handle)
 */

#define THIS_MODULE base
#include "x_macros.sqf"

if (isServer) then {
    private ["_trigger"];
    
    {
        private ["_amount"];

        _amount = if (count _x > 3) then {_x select 3} else {1};
        
        for "_i" from 1 to _amount do {
            private ["_marker", "_group"];

            _marker = format [
                "d_%1%2",
                _x select 0,
                if (_amount > 1) then {format ["_%1", _i]} else {""}
            ];
            
            [
                markerPos _marker,
                0,
                [_x select 1, "us_army"],
                [
                    _x select 2
                ]
            ] call FUNC(server,objectMapper);
            
            _group = [
                markerPos _marker,
                west,
                (configFile >> "CfgGroups" >> "West" >> "BIS_US" >> "Infantry" >> "US_TeamSupport")
            ] call FUNC(server,spawnGroup);
            
            if (!isNil QMODULE(unit)) then {
                [_group, markerPos _marker] call FUNC(unit,defend);
            };
        };
    } forEach [
        [
            "base_radar",
            "radar",
            ["76n6ClamShell_EP1", "US_WarfareBAntiAirRadar_EP1"]
        ], [
            "base_anti_air",
            "anti-air",
            [],
            2
        ]
    ];
    
    _trigger = createTrigger ["EmptyDetector", markerPos QGVAR(base_south)];
    _trigger setTriggerArea [430, 200, -30.4639, true];
    _trigger setTriggerActivation ["EAST", "PRESENT", true];
    _trigger setTriggerStatements [
        "this",
        "{if (!isPlayer _x && {_x isKindOf 'CAManBase'}) then {_x setDamage 1}} forEach thisList",
        ""
    ];

    if !(isNil QMODULE(base_uav)) then {
        __submodulePP(base_uav);
    };
};

{
    {
        _x addEventHandler ["HandleDamage", {0}];
    } forEach (allMissionObjects _x);
} forEach GVAR(base_types_protected);