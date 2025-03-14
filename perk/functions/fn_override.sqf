#include "x_macros.sqf"

switch (true) do {
    case !(isNil QMODULE(debug));
    case (!isNil QMODULE(database) && {!isNil {X_JIPH getVariable QGVAR(holiday)}}): {
        true
    };

    default {
        false
    };
};