#include "x_macros.sqf"

if !(isNil QMODULE(accolade)) then {
    case "accolade": {
        closeDialog 0;

        [
            "npc",
            GVAR(accolade_types) select (([0, GVAR(accolade_types)] call FUNC(common,arrayValues)) find (_lbData select 1))
        ] call FUNC(accolade,show);

        false
    };
};