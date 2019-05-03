#define THIS_MODULE construction
#include "x_macros.sqf"

PARAMS_1(_name);

player playMove "AinvPknlMstpSlayWrflDnon_medic";

_type = call FUNC(THIS_MODULE,type);

sleep 7;

_position = player modelToWorld [0, 7, 0];

_object = _type createVehicle _position;
_object setDir ((getDir player) - 180);
_object setPos _position;

[nil, nil, rExecVM, __function(action), _name, _object] call RE;

player setVariable [QGVAR(_name), (player getVariable QGVAR(_name)) - 1];