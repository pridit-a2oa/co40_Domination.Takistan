#include "x_macros.sqf"
private ["_vehicle", "_type", "_vehicles", "_array"];

PARAMS_2(_vehicle, _type);

_vehicles = [0, GVAR(base_rd) getVariable QGVAR(progress)] call FUNC(common,arrayValues);

_array = [];

switch (_type) do {
    case "progress": {
        private ["_current", "_required"];

        {
            if (_vehicle isKindOf _x) exitWith {
                _current = ((GVAR(base_rd) getVariable QGVAR(progress)) select (_vehicles find _vehicle)) select 1;
                _required = (GVAR(base_rd_amount_required) select _forEachIndex) select 0;

                _array = [_current min _required, _required];
            };
        } forEach ([1, GVAR(base_rd_amount_required)] call FUNC(common,arrayValues));
    };

    case "time": {
        private ["_construct", "_deconstruct"];

        {
            if (_vehicle isKindOf _x) exitWith {
                _construct = ((GVAR(base_rd_time_construct) select _forEachIndex) select 0);
                _deconstruct = _construct / GVAR(base_rd_time_divisor);

                _array = [_construct, _deconstruct];
            };
        } forEach ([1, GVAR(base_rd_time_construct)] call FUNC(common,arrayValues));
    };
};

_array