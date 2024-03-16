/**
 * Vehicle Pack Module - Language Submodule
 */

#define THIS_MODULE vehicle_pack
#include "x_macros.sqf"

GVAR(language_vehicle_pack_en) = [
    ["Fold", "Fold"],
    ["MainRotor", "Main Rotor"],
    ["Unfold", "Unfold"],
    ["Wings", "Wings"]
];

{
    format ["d_language_%1_%2", QUOTE(THIS_MODULE), toLower _x] = [
        ["Fold", "Fold"],
        ["MainRotor", "Main Rotor"],
        ["Unfold", "Unfold"],
        ["Wings", "Wings"]
    ];
} forEach [0, GVAR(language_types)] call FUNC(common,arrayValues);

{
    format ["d_language_%1_%2", QUOTE(THIS_MODULE), _x select 0] = _x select 1;
} forEach [
    ["CZ", [
        ["Fold", ""],
        ["MainRotor", ""],
        ["Unfold", ""],
        ["Wings", ""]
    ]],

    ["EN", [
        ["Fold", "Fold"],
        ["MainRotor", "Main Rotor"],
        ["Unfold", "Unfold"],
        ["Wings", "Wings"]
    ]]
]

GVAR(language_vehicle_pack) = [
    ["Fold", [
        ["CZ", ""],
        ["EN", "Fold"],
        ["FR", ""],
        ["DE", ""],
        ["IT", ""],
        ["PL", ""],
        ["RU", ""],
        ["ES", ""]
    ]],

    ["MainRotor", [
        ["CZ", ""],
        ["EN", "Main Rotor"],
        ["FR", ""],
        ["DE", ""],
        ["IT", ""],
        ["PL", ""],
        ["RU", ""],
        ["ES", ""]
    ]],

    ["Unfold", [
        ["CZ", ""],
        ["EN", "Unfold"],
        ["FR", ""],
        ["DE", ""],
        ["IT", ""],
        ["PL", ""],
        ["RU", ""],
        ["ES", ""]
    ]],

    ["Wings", [
        ["CZ", ""],
        ["EN", "Wings"],
        ["FR", ""],
        ["DE", ""],
        ["IT", ""],
        ["PL", ""],
        ["RU", ""],
        ["ES", ""]
    ]]
];