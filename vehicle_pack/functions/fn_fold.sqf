#include "x_macros.sqf"
private ["_vehicle", "_phase"];

PARAMS_2(_vehicle, _phase);

_vehicle setVariable [QGVAR(packed), (_phase > 0), true];

switch (typeOf _vehicle) do {
    case "AH1Z": {
        _vehicle animate ["mainrotor_folded", 1 - _phase];
        _vehicle animate ["mainrotor_unfolded", _phase];
        _vehicle animate ["rotorshaft_unfolded", _phase];
    };
    
    case "MV22": {
        _vehicle animate ["engine_prop_1_1_turn", _phase];
        _vehicle animate ["engine_prop_1_2_turn", _phase];
        _vehicle animate ["engine_prop_1_3_turn", _phase];
        _vehicle animate ["engine_prop_2_1_turn", _phase];
        _vehicle animate ["engine_prop_2_2_turn", _phase];
        _vehicle animate ["engine_prop_2_3_turn", _phase];
        _vehicle animate ["engine_prop_1_1_close", _phase];
        _vehicle animate ["engine_prop_1_3_close", _phase];
        _vehicle animate ["engine_prop_2_1_close", _phase];
        _vehicle animate ["engine_prop_2_2_close", _phase];
        _vehicle animate ["pack_engine_1", _phase];
        _vehicle animate ["pack_engine_2", _phase];
        _vehicle animate ["turn_wing", _phase];
    };
    
    case "UH1Y": {
        _vehicle animate ["mainrotor_folded", 1 - _phase];
        _vehicle animate ["mainrotor_unfolded", _phase];
    };
};