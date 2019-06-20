/**
 * Original Author: Karel Moricky
 */

#define THIS_MODULE 3d
#include "x_macros.sqf"
private ["_object", "_text", "_countdown", "_dialog", "_width", "_height"];

PARAMS_3(_object, _text, _countdown);

GVAR(3d_type_layer) cutRsc ["XD_3DText", "PLAIN"];
GVAR(3d_type_layer) = GVAR(3d_type_layer) + 1;

_layer = GVAR(3d_type_layer);

_dialog = DIALOG(QGVAR(BIS_dynamicText), 1);

_dialog ctrlSetFade 1;
_dialog ctrlCommit 0;
_dialog ctrlSetStructuredText parseText _text;
_dialog ctrlCommit 0;

_width = safezoneW;
_height = safezoneH;

while {alive _object} do {
    if (player getVariable QGVAR(3d) select 1 == "true") then {
        _distance = player distance (position _object);
        _alpha = abs ((_distance / GVAR(3d_distance_visible)) - GVAR(3d_distance_fade));
        
        if (_alpha <= 1 && {!visibleMap}) then {
            _pos2D = worldToScreen (position _object);
            
            _newText = _text;
            
            if (!isNil "_countdown" && {_countdown}) then {
                _timeLeft = [_object] call FUNC(THIS_MODULE,time);
                
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
    } else {
        _dialog ctrlSetFade 1;
        _dialog ctrlCommit 0.1;
        
        sleep 1;
    };
    
    sleep 0.01;
};

_dialog ctrlSetFade 1;
_dialog ctrlCommit 0;

_layer cutRsc ["Default", "PLAIN"];