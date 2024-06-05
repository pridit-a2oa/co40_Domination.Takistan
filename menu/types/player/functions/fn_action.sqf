#include "x_macros.sqf"

if !(isNil QMODULE(drag)) then {
    case "drag": {
        closeDialog 0;

        [_entity] spawn FUNC(drag,drag);

        false
    };
};

if !(isNil QMODULE(inventory) && {isNil QMODULE(inventory_medical)}) then {
    case "medical": {
        [_entity, "medical"] call FUNC(inventory,transfer);

        true
    };
};

if !(isNil QMODULE(inventory) && {isNil QMODULE(inventory_refuel)}) then {
    case "refuel": {
        [_entity, "refuel"] call FUNC(inventory,transfer);

        true
    };
};

if !(isNil QMODULE(inventory) && {isNil QMODULE(inventory_repair)}) then {
    case "repair": {
        [_entity, "repair"] call FUNC(inventory,transfer);

        true
    };
};

if !(isNil QMODULE(revive)) then {
    case "revive": {
        closeDialog 0;

        [_entity] spawn FUNC(revive,revive);

        false
    };
};

if !(isNil QMODULE(squad)) then {
    case "squad": {
        closeDialog 0;

        [_entity] call FUNC(squad,join);

        false
    };
};