// $[1.03,[[0,0,1,1],0.03125,0.05],[1200,"",[0,"\ca\ui\data\ui_gameoptions_background_ca",[0.311555,0.212878,0.395518,0.650505],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],""],[]],[1700,"",[0,"OK",[0.51247,0.657926,0.162563,0.110005],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],""],[]],[1500,"",[0,"",[0.315024,0.276517,0.364847,0.324891],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],""],[]],[1000,"",[0,"",[0.323231,0.22987,0.286869,0.0455628],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],""],[]],[1100,"",[0,"",[0.315656,0.603896,0.365151,0.0705628],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],""],[]]]
class XD_VehicleMenuDialog {
    idd = -1;
    movingEnable = 1;
    onLoad = "uiNamespace setVariable ['X_VEHICLE_MENU_DIALOG', _this select 0]";
    onUnLoad = "uiNamespace setVariable ['X_VEHICLE_MENU_DIALOG', nil]";
    objects[] = {};
    class controlsBackground {
        class RscPicture_1200: XD_RscPicture
        {
            idc = 1200;
            text = "\ca\ui\data\ui_gameoptions_background_ca";
            x = 0.311555;
            y = 0.212878;
            w = 0.395518;
            h = 0.650505;
        };
    };
    class controls {
        class RscText_1000: X3_RscText
        {
            idc = 1000;
            x = 0.323231;
            y = 0.22987;
            w = 0.286869;
            h = 0.0455628;
            style = ST_LEFT;
        };
        class RscShortcutButton_1700: XD_ButtonBase
        {
            idc = 1700;
            text = "OK";
            action = "[vehicle player] call d_fnc_vehicle_menu_action";
            x = 0.51247;
            y = 0.657926;
            w = 0.162563;
            h = 0.110005;
        };
        class RscListbox_1500: RscListBox
        {
            idc = 1500;
            x = 0.315024;
            y = 0.276517;
            w = 0.364847;
            h = 0.324891;
            sizeEx = 0.023;
            rowHeight = 0.0648;
            style = CT_NO_BORDER + ST_LEFT;
            borderSize = 1;
            onLBDblClick = "[vehicle player] call d_fnc_vehicle_menu_action";
        };
        class RscStructuredText_1100: BBRscStructuredText
        {
            idc = 1100;
            x = 0.315656;
            y = 0.603896;
            w = 0.365151;
            h = 0.0705628;
            size = 0.025;
            colorBackground[] = {0.173, 0.157, 0.094, 1};
        };
    };
};