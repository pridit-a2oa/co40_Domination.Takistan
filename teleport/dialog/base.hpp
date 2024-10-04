class XD_TeleportDialog {
    idd = -1;
    movingEnable = false;
    objects[] = {};
    onLoad="uiNamespace setVariable ['X_TELEPORT_DIALOG', _this select 0]; d_teleport = nil";
    onUnLoad="uiNamespace setVariable ['X_TELEPORT_DIALOG', nil]; d_teleport = nil";
    class controlsBackground {
        class RscTeleportBackground: RscMapWithListBackground {};
    };
    class controls {
        class RscTeleportTextTitle: RscMapWithListTextTitle
        {
            text = "Fast Travel";
        };
        class RscTeleportMapControl: RscMapWithListMapControl
        {
            idc = 10000;
            onMouseButtonDown = "if !([lbCurSel 1500, -1] call BIS_fnc_areEqual) then {call d_fnc_teleport_populate}";
            onMouseZChanged = "if !([lbCurSel 1500, -1] call BIS_fnc_areEqual) then {call d_fnc_teleport_populate}";
        };
        class RscTeleportListbox: RscMapWithListListbox
        {
            idc = 1500;
            onLBSelChanged = "[_this select 1] call d_fnc_teleport_switch";
            onLBDblClick = "call d_fnc_teleport_action";
        };
        class RscTeleportButtonAction: RscMapWithListButtonAction
        {
            idc = 2000;
            action = "call d_fnc_teleport_action";
        };
        class RscTeleportButtonClose: RscMapWithListButtonClose {};
    };
};