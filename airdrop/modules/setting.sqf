/**
 * Airdrop Module - Setting Submodule
 */

#include "x_macros.sqf"

GVAR(setting_type_valid) = GVAR(setting_type_valid) + [
    [
        "Airdrop",
        "airdrop_type",
        "Set airdrop payload (cooldown time is unaffected)",
        [0, player getVariable QGVAR(airdrop_types)] call FUNC(common,arrayValues),
        [1, player getVariable QGVAR(airdrop_types)] call FUNC(common,arrayValues)
    ]
];

GVAR(setting_type_default) = GVAR(setting_type_default) + [
    (GVAR(airdrop_type_payloads) select 0) select 1
];