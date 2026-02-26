#define THIS_MODULE accolade
#include "x_macros.sqf"
private ["_parent", "_group"];

PARAMS_1(_parent);

_group = createGroup west;

_entities = [];

{
    private ["_objects", "_location", "_position", "_entity"];

    _objects = call compile format ["d_%1_%2_objects", QUOTE(THIS_MODULE), _x select 0];
    _location = call compile format ["d_%1_%2_location", QUOTE(THIS_MODULE), _x select 0];

    if !([_objects, []] call BIS_fnc_areEqual) then {
        {
            private ["_position"];

            _position = [
                ((_location select 0) select 0) + ((_x select 1) select 0),
                ((_location select 0) select 1) + ((_x select 1) select 1),
                ((_location select 0) select 2) + ((_x select 1) select 2)
            ];

            _position = _parent modelToWorld _position;

            _object = createVehicle [_x select 0, _position, [], 0, "CAN_COLLIDE"];
            _object setDir ((direction _parent) + (_x select 2));
            _object setPosATL _position;
            _object setVectorUp surfaceNormal _position;
            _object addEventHandler ["HandleDamage", {0}];

            [true, "enableSimulation", [_object, false]] call FUNC(network,mp);
        } forEach _objects;
    };

    _position = _parent modelToWorld (_location select 0); // [-2.8, (-abs(_forEachIndex) - 2), -5]

    _entity = _group createUnit [_x select 2, [0, 0, 0], [], 0, "CAN_COLLIDE"];
    _entity addEventHandler ["HandleDamage", {0}];

    removeAllWeapons _entity;

    // _entity switchMove "";
    _entity disableAI "MOVE";
    _entity setCombatMode "BLUE";
    // _entity setUnitPos "UP";
    _entity setDir ((direction _parent) + (_location select 1)); // ((_location select 1) - 180)
    _entity setPos _position;

    [_entity, _position, _x select 0] spawn FUNC(THIS_MODULE,animation);

    X_JIP setVariable [
        QGVAR(accolades),
        (X_JIP getVariable QGVAR(accolades)) + [_entity],
        true
    ];
} forEach GVAR(accolade_types);

_group allowFleeing 0;