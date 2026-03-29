#define THIS_MODULE vehicle_pack
#include "x_macros.sqf"
private ["_vehicle", "_phase"];

PARAMS_1(_vehicle);

switch (typeOf _vehicle) do {
    case "AH1Z": {
        _phase = [_this, 1, 1 - (_vehicle animationPhase "mainrotor_unfolded")] call FUNC(common,param);

        if !([_vehicle, _phase, "mainrotor_unfolded"] call FUNC(THIS_MODULE,valid)) exitWith {};

        _vehicle animate ["mainrotor_folded", 1 - _phase];

        {
            _vehicle animate [_x, _phase];
        } forEach [
            "mainrotor_unfolded",
            "rotorshaft_unfolded"
        ];
    };

    case "MV22": {
        _phase = [_this, 1, 1 - (_vehicle animationPhase "turn_wing")] call FUNC(common,param);

        if !([_vehicle, _phase, "turn_wing"] call FUNC(THIS_MODULE,valid)) exitWith {};

        {
            _vehicle animate [_x, _phase];
        } forEach [
            "engine_prop_1_1_turn",
            "engine_prop_1_2_turn",
            "engine_prop_1_3_turn",
            "engine_prop_2_1_turn",
            "engine_prop_2_2_turn",
            "engine_prop_2_3_turn",
            "engine_prop_1_1_close",
            "engine_prop_1_3_close",
            "engine_prop_2_1_close",
            "engine_prop_2_2_close",
            "pack_engine_1",
            "pack_engine_2",
            "turn_wing"
        ];
    };

    case "UH1Y": {
        _phase = [_this, 1, 1 - (_vehicle animationPhase "mainrotor_unfolded")] call FUNC(common,param);

        if !([_vehicle, _phase, "mainrotor_unfolded"] call FUNC(THIS_MODULE,valid)) exitWith {};

        _vehicle animate ["mainrotor_folded", 1 - _phase];
        _vehicle animate ["mainrotor_unfolded", _phase];
    };
};