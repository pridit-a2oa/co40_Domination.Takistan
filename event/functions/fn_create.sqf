#define THIS_MODULE event
#include "x_macros.sqf"
private ["_type", "_log", "_target", "_trigger"];

PARAMS_2(_type, _log);

while {isNil "_target" || {[typeName _target, "BOOL"] call BIS_fnc_areEqual}} do {
    private ["_position"];

    _position = (call compile format [QUOTE(%1), format ["d_%1_%2_positions", QUOTE(THIS_MODULE), toLower _type]]) call BIS_fnc_selectRandom;

    _target = (switch ([{(_x distance (_position select 0)) < GVAR(event_distance_create)} count (call FUNC(common,players)), 0] call BIS_fnc_areEqual) do {
        case true: {
            [_position] call (call compile format [
                "d_fnc_%1_%2_create",
                QUOTE(THIS_MODULE),
                toLower _type
            ]);
        };

        case false: {
            false
        };
    });

    sleep 5;
};

_trigger = createTrigger ["EmptyDetector", _target select 0];
_trigger setVariable ["type", _type];
_trigger setVariable ["entities", _target select 1];
_trigger setTriggerActivation ["NONE", "PRESENT", false];
_trigger setTriggerStatements [
    "({_x isKindOf ""CAManBase"" && {alive _x}} count (thisTrigger getVariable ""entities"")) < 2",
    "[thisTrigger getVariable ""type"", true] spawn d_fnc_event_create; [position thisTrigger, thisTrigger getVariable ""entities""] spawn d_fnc_event_cleanup; deleteVehicle thisTrigger",
    ""
];

if !(isNil "_log") then {
    __log format ["Generated %1", _type]];
};

_target