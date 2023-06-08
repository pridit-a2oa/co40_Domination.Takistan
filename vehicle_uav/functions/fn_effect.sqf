/**
 * Original Author: Karel Moricky
 */

#include "x_macros.sqf"
private ["_state"];

PARAMS_1(_state);

switch (_state) do {
    case true: {
        private ["_color", "_blur", "_grain"];

        _color = ppEffectCreate ["ColorCorrections", 1999];
        _color ppEffectEnable true;
        _color ppEffectAdjust [1, 1, 0, [1, 1, 1, 0], [1, 1, 1, 0.0], [1, 1, 1, 1.0]];
        _color ppEffectCommit 0;

        _blur = ppEffectCreate ["dynamicBlur", 505];
        _blur ppEffectEnable true;  
        _blur ppEffectAdjust [.5];
        _blur ppEffectCommit 0;

        _grain = ppEffectCreate ["filmGrain", 2005];
        _grain ppEffectEnable true;
        _grain ppEffectAdjust [0.02, 1, 1, 0, 1];
        _grain ppEffectCommit 0;

        {
            [GVAR(vehicle_uav_effects), _x] call BIS_fnc_arrayPush;
        } forEach [_color, _blur, _grain];
    };

    case false: {
        {
            ppEffectDestroy _x;
        } forEach GVAR(vehicle_uav_effects);

        GVAR(vehicle_uav_effects) = [];
    };
};