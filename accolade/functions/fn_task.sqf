#define THIS_MODULE accolade
#include "x_macros.sqf"
private ["_index", "_type"];

PARAMS_2(_index, _type);

(
    (player getVariable QGVAR(tasks))
    select
    ([0, GVAR(accolade_types)] call FUNC(common,arrayValues) find _type)
) select _index