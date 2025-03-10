/**
 * Base R&D Module - 3D Submodule
 */

#define THIS_MODULE base_rd
#include "x_macros.sqf"

[
    GVAR(base_rd),
    format ["%1<br /><t color='#f0bfbfbf' size='0.6'>Reverse engineer and build OPFOR vehicles</t>", "R&amp;D" call FUNC(common,KhakiText)],
    [],
    true,
    true
] spawn FUNC(3d,create);