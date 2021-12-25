#define THIS_MODULE base_rd
#include "x_macros.sqf"

disableSerialization;

createDialog "XD_BaseRdDialog";

call FUNC(THIS_MODULE,populate);

lbSortByValue (DIALOG("X_RD_DIALOG", 100));

DIALOG("X_RD_DIALOG", 100) lbSetCurSel 0;