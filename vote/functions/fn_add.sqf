#include "x_macros.sqf"
private ["_idc", "_name", "_list", "_index"];

PARAMS_2(_idc, _name);

disableSerialization;

_list = DIALOG("X_VOTE_DIALOG", _idc);

_index = _list lbAdd _name;

_list lbSetPicture [
    _index,
    (switch (_idc) do {
        case 200: {
            "ca\ui\data\ui_task_done_ca"
        };

        case 201: {
            "ca\ui\data\ui_task_failed_ca"
        };
    })
];