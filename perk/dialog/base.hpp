// $[1.03,[[0,0,1,1],0.01,0.01],[1201,"",[0,"ca\ui\data\ui_dsinterface_background_ca",[0.267525,0.015,0.817,1.72],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],""],[]],[1001,"",[0,"Perks",[0.28,0.045,0.201547,0.0400432],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],""],[]],[1000,"",[0,"Points:",[0.48,0.045,0.201547,0.0400432],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],""],[]],[1200,"",[0,"ca\ui\data\cmdbar_background_ca",[0.68,0.045,0.0625,0.075],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],""],[]],[1002,"",[0,"2",[0.685,0.015,0.0267678,0.101732],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],""],[]],[1700,"",[0,"Close",[0.545,0.855,0.163131,0.113468],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],""],[]],[1003,"",[0,"",[0.275,0.87,0.25,0.1],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],""],[]],[1202,"",[0,"ca\ui\data\cmdbar_player_ca",[0.679996,0.0432685,0.0612374,0.0784632],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],""],[]],[1600,"",[0,"",[0.68,0.0450008,0.0314647,0.0377058],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],""],[]]]
class XD_PerkDialog {
    idd = -1;
    movingEnable = 1;
    onLoad = "uiNamespace setVariable ['X_PERK_DIALOG', _this select 0];d_perk_dialog_open = true";
    onUnLoad = "uiNamespace setVariable ['X_PERK_DIALOG', nil];d_perk_dialog_open = false";
    objects[] = {};
    class controlsBackground {
        class PerksDialogBackground: XD_RscPicture
        {
            text = "ca\ui\data\ui_dsinterface_background_ca";
            x = 0.265;
            y = 0.015;
            w = 0.817;
            h = 1.72;
        };
        class PerksDialogBackgroundColor: XC_RscText
        {
            x = 0.268935;
            y = 0.0999998;
            w = 0.459849;
            h = 0.75974;
            colorBackground[] = {0.247,0.2,0.137,0.5};
        };
    };
    class controls {
        #include "partial\icons\background.hpp"
        #include "partial\button.hpp"
        #include "partial\bar.hpp"
        #include "partial\icons\image.hpp"
        #include "partial\icons\overlay.hpp"
        class MenuText: X3_RscText
        {
            text = "Perks";
            x = 0.28;
            y = 0.045;
            w = 0.201547;
            h = 0.0400432;
            style = ST_LEFT;
        };
        class AvailablePointsText: X3_RscText
        {
            text = "Points:";
            x = 0.48;
            y = 0.045;
            w = 0.201547;
            h = 0.0400432;
            style = ST_RIGHT;
        };
        class AvailablePointsValueText: X3_RscText {
            idc = 1;
            x = 0.685;
            y = 0.015;
            w = 0.0267678;
            h = 0.101732;
            style = ST_CENTER;
        };
        class AvailablePointsValueBackgroundPicture: XD_RscPicture
        {
            text = "ca\ui\data\cmdbar_background_ca";
            x = 0.68;
            y = 0.045;
            w = 0.0625;
            h = 0.075;
            colorText[] = {0.1, 0.1, 0.1, 0.5};
        };
        class AvailablePointsValueBackgroundOutlinePicture: XD_RscPicture
        {
            text = "ca\ui\data\cmdbar_player_ca";
            x = 0.679996;
            y = 0.0432685;
            w = 0.0612374;
            h = 0.0784632;
            colorText[] = {0.1, 0.1, 0.1, 1};
        };
        class AvailablePointsValueTooltipButton: XD_LinkButtonBase
        {
            idc = 5;
            x = 0.68;
            y = 0.0450008;
            w = 0.0314647;
            h = 0.0377058;
            default = true;
        };
        class HelpText: X3_RscText
        {
            idc = 10;
            style = ST_MULTI;
            x = 0.275;
            y = 0.87;
            w = 0.25;
            h = 0.1;
            lineSpacing = 1;
            sizeEx = 0.028;
        };
        class HolidayText: X3_RscText
        {
            idc = 20;
            style = ST_MULTI + ST_CENTER;
            x = 0.275;
            y = 0.87;
            w = 0.25;
            h = 0.1;
            lineSpacing = 1;
            sizeEx = 0.028;
        };
        class CloseButton: XD_ButtonBase
        {
            text = "Close";
            action = "CloseDialog 0";
            x = 0.545;
            y = 0.855;
            w = 0.163131;
            h = 0.113468;
            default = false;
        };
    };
};