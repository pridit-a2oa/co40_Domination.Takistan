/**
 * Admin Captive Module - Communication Submodule
 */

#define THIS_MODULE admin_captive
#include "x_macros.sqf"

if !(isNil QMODULE(communication)) then {
    call FUNC(THIS_MODULE,populate);

    BIS_MENU_Admin = BIS_MENU_Admin + [
        ["Captive", [(count BIS_MENU_Admin) + 1], "#USER:BIS_MENU_AdminCaptive", -5, [["expression", ""]], "1", "1"]
    ];
};