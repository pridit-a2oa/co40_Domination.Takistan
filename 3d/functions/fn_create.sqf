/**
 * Original Author: Karel Moricky
 */

#define THIS_MODULE 3d
#include "x_macros.sqf"
private ["_object", "_text", "_visibility", "_setting", "_countdown", "_dialog", "_width", "_height"];

PARAMS_5(_object, _text, _visibility, _setting, _countdown);

disableSerialization;

waitUntil {sleep 1; !isNil QMODULE(3d)};

if (count _visibility < 1) then {
    _visibility = [GVAR(3d_distance_fade), GVAR(3d_distance_visible)];
};

GVAR(3d_type_layer) cutRsc ["XD_3DText", "PLAIN"];
GVAR(3d_type_layer) = GVAR(3d_type_layer) + 1;

_dialog = DIALOG(QGVAR(BIS_dynamicText), 1);

_dialog ctrlSetFade 1;
_dialog ctrlCommit 0;
_dialog ctrlSetStructuredText parseText _text;
_dialog ctrlCommit 0;

_width = safezoneW;
_height = safezoneH;

while {alive _object} do {
    if (!_setting || {[player getVariable QGVAR(3d) select 1, 10] call BIS_fnc_areEqual}) then {
        _distance = player distance (position _object);

        _alpha = abs ((_distance / (_visibility select 1)) - (_visibility select 0));

        if !(_object isKindOf "Static") then {
            switch (true) do {
                case (count crew _object > 0);
                case !(simulationEnabled _object);
                case ((position _object) select 2 > 1);
                case ((vehicle player) isKindOf "Air");
                case (_object distance (markerPos QGVAR(base_south)) > 500): {
                    _alpha = 2;
                };
            };
        };

        if (_alpha <= 1 && {!visibleMap}) then {
            _pos2D = worldToScreen (_object modelToWorld ([typeOf _object] call FUNC(THIS_MODULE,offset)));

            _newText = _text;

            if (!isNil "_countdown" && {_countdown}) then {
                _timeLeft = [_object] call FUNC(THIS_MODULE,time);

                if (_timeLeft > 0) then {
                    _newText = _text + format ["<br /><t color='#f0bfbfbf' size='0.6'>%1</t>", [_timeLeft] call FUNC(common,displayTime)];
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