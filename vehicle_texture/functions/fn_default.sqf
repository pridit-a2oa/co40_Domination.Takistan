#include "x_macros.sqf"
private ["_vehicle", "_texture"];

PARAMS_1(_vehicle);

_texture = switch (_vehicle) do {
    case "A10_US_EP1": {
        [
            "\ca\a10\Data\a10_01_co",
            "\ca\a10\Data\a10_02_co"
        ]
    };

    case "C130J_US_EP1": {
        [
            "\ca\air2\c130j\data\c130j_body_co",
            "\ca\air_e\c130j\data\c130j_wings_co"
        ]
    };
};

_texture