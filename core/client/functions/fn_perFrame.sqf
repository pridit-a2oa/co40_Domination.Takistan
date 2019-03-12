#include "x_macros.sqf"

FUNC(client,removePerFrame) = {
    hint "test";
    private "_name";
    PARAMS_1(_name);
    _name = toLower _name;
    GVAR(perframe_store) setVariable [_name, nil];
    GVAR(perframe_array) = GVAR(perframe_array) - [_name];
};