/**
 * Marker Module
 *
 * Description: This module handles the creation & persistence of markers for
 * connected & JIP clients.
 */

#define THIS_MODULE marker
#include "x_macros.sqf"

if (isServer) then {
    X_JIP setVariable [QGVAR(markers), [], true];
};

__cppfln(FUNC(THIS_MODULE,create),THIS_MODULE\functions\fn_create.sqf);
__cppfln(FUNC(THIS_MODULE,delete),THIS_MODULE\functions\fn_delete.sqf);

MODULE(THIS_MODULE) = true;