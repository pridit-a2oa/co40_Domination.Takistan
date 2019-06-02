/**
 * Original Author: Karel Moricky
 */

#include "x_macros.sqf"
private ["_position", "_text", "_module", "_dialog", "_width", "_height"];

PARAMS_3(_position, _text, _module);

GVAR(3d_type_layer) cutRsc ["XD_3DText", "PLAIN"];
GVAR(3d_type_layer) = GVAR(3d_type_layer) + 1;

_dialog = DIALOG(QGVAR(BIS_dynamicText), 1);

_dialog ctrlSetFade 1;
_dialog ctrlCommit 0;
_dialog ctrlSetStructuredText parseText _text;
_dialog ctrlCommit 0;

_width = safezoneW;
_height = safezoneH;

while {true} do {
    _distance = player distance _position;
    _alpha = abs ((_distance / GVAR(3d_distance_visible)) - GVAR(3d_distance_fade));
    
    if (_alpha <= 1 && {!visibleMap}) then {
        _pos2D = worldToScreen _position;
        
        _newText = _text;
        
        if (!isNil "_module") then {
            _timeLeft = [] call (call compile format ["d_fnc_%1_time", _module]);
            
            if (_timeLeft > 0) then {
                _newText = _text + format ["<br /><t size='0.6'>%1</t>", [_timeLeft] call FUNC(common,displayTime)];
            };
        };
        
        if (count _pos2D > 0) then {
            _dialog ctrlSetPosition [(_pos2D select 0) - _width / 2, (_pos2D select 1) - _height / 3, _width, _height];
            _dialog ctrlSetStructuredText parseText _newText;
            _dialog ctrlSetFade (_alpha^3);
            _dialog ctrlCommit 0;
        } else {
            _dialog ctrlSetFade 1;
            _dialog ctrlCommit 0.1;
        };
    } else {
        _dialog ctrlSetFade 1;
        _dialog ctrlCommit 0.1;

        sleep 0.1;
    };
    
    sleep 0.01;
};