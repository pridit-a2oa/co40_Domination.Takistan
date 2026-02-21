// $[1.03,[[0,0,1,1],0.01,0.01],[1200,"",[0,"ca\ui\data\ui_background_controls_ca.paa",[0.275726,0.195238,0.577274,0.611018],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],""],[]],[1201,"",[0,"ca\ui\data\ui_background_video_buttons_ca",[0.271464,0.369805,0.572387,0.099953],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],""],[]],[1900,"",[0,"",[0.354375,0.28,0.294333,0.0290044],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],""],[]],[1701,"",[0,"Overview",[0.28125,0.705,0.173232,0.113468],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],""],[]],[1700,"",[0,"Close",[0.556875,0.705,0.16,0.113468],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],""],[]],[1204,"",[0,"\ca\warfare2\Images\rank_private",[0.298125,0.27,0.0369696,0.0463203],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],""],[]],[1202,"",[0,"\ca\warfare2\Images\rank_private",[0.669375,0.27,0.0369696,0.0463203],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],""],[]],[1001,"",[0,"200",[0.655,0.31,0.0633839,0.0584416],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],""],[]],[1002,"",[0,"Accolades",[0.28125,0.205,0.116414,0.0549783],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],""],[]],[1004,"",[0,"0",[0.466875,0.31,0.0659091,0.0584416],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],""],[]],[1000,"",[0,"100",[0.285,0.31,0.0633839,0.0584416],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],""],[]],[1600,"",[0,"",[0.298125,0.27,0.0369696,0.0463203],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],""],[]],[1601,"",[0,"",[0.669375,0.27,0.0369696,0.0463203],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],""],[]],[1602,"",[0,"",[0.354375,0.28,0.294333,0.0290044],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],""],[]]]
class XD_AccoladeDialog {
    idd = -1;
    movingEnable = false;
    objects[] = {};
    onLoad="uiNamespace setVariable ['X_ACCOLADE_DIALOG', _this select 0]";
    onUnLoad="uiNamespace setVariable ['X_ACCOLADE_DIALOG', nil]";
    class controlsBackground {
        class AccoladeBackgroundPicture: XD_RscPicture
        {
            text = "ca\ui\data\ui_background_controls_ca";
            x = 0.275726;
            y = 0.195238;
            w = 0.577274;
            h = 0.611018;
        };
        class AccoladeBackgroundColorText: XC_RscText
        {
            x = 0.279041;
            y = 0.255845;
            w = 0.444697;
            h = 0.469;
            colorBackground[] = {0.247,0.2,0.137,0.6};
        };
        class AccoladeDividerPicture: XD_RscPicture
        {
            text = "ca\ui\data\ui_background_video_buttons_ca";
            x = 0.271464;
            y = 0.369805;
            w = 0.572387;
            h = 0.099953;
        };
    };
    class controls {
        #include "partial\discipline.hpp"
        #include "partial\overview.hpp"
        #include "partial\headshot\overlay.hpp"
        #include "partial\headshot\background.hpp"
        #include "partial\headshot\photo.hpp"
        class AccoladeTitleText: X3_RscText
        {
            text = "Accolades";
            x = 0.28125;
            y = 0.205;
            w = 0.116414;
            h = 0.0549783;
            style = ST_LEFT;
        };
        class AccoladeRankCurrentPicture: XD_RscPicture
        {
            idc = 100;
            x = 0.298125;
            y = 0.27;
            w = 0.0369696;
            h = 0.0463203;
            colorText[] = {0.89,0.804,0.365,1};
        };
        class AccoladeRankNextPicture: XD_RscPicture
        {
            idc = 101;
            x = 0.669375;
            y = 0.27;
            w = 0.0369696;
            h = 0.0463203;
            colorText[] = {0.89,0.804,0.365,1};
        };
        class AccoladeRankCurrentTooltipButton: XD_LinkButtonBase
        {
            idc = 110;
            x = 0.298125;
            y = 0.27;
            w = 0.0369696;
            h = 0.0463203;
        };
        class AccoladeRankNextTooltipButton: XD_LinkButtonBase
        {
            idc = 111;
            x = 0.669375;
            y = 0.27;
            w = 0.0369696;
            h = 0.0463203;
        };
        class AccoladeRankXPAlternateTooltipButton: XD_LinkButtonBase
        {
            idc = 112;
            x = 0.354375;
            y = 0.28;
            w = 0.294333;
            h = 0.0290044;
        };
        class AccoladeRankBackgroundProgressBar: RscProgressBar
        {
            idc = 201;
            x = 0.354375;
            y = 0.28;
            w = 0.294333;
            h = 0.0290044;
            colorFrame[] = {1,1,1,0};
            colorBar[] = {0.208,0.173,0.137,0.5};
        };
        class AccoladeRankProgressBar: RscProgressBar
        {
            idc = 200;
            x = 0.354375;
            y = 0.28;
            w = 0.294333;
            h = 0.0290044;
            colorFrame[] = {1,1,1,0};
            colorBar[] = {0.639,0.576,0.427,1};
        };
        class AccoladeXPPreviousAmountText: X3_RscText
        {
            idc = 300;
            x = 0.285;
            y = 0.31;
            w = 0.0633839;
            h = 0.0584416;
            style = ST_CENTER;
        };
        class AccoladeXPNextAmountText: X3_RscText
        {
            idc = 301;
            x = 0.655;
            y = 0.31;
            w = 0.0633839;
            h = 0.0584416;
            style = ST_CENTER;
        };
        class AccoladeXPCurrentAmountText: X3_RscText
        {
            idc = 302;
            x = 0.466875;
            y = 0.31;
            w = 0.0659091;
            h = 0.0584416;
            sizeEx = 0.028;
            style = ST_CENTER;
        };
        class AccoladeSectionTitleText: X3_RscText
        {
            idc = 400;
            x = 0.28125;
            y = 0.367;
            w = 0.196414;
            h = 0.0549783;
            sizeEx = 0.028;
            style = ST_LEFT;
        };
        class AccoladeToggleViewButton: XD_ButtonBase
        {
            idc = 500;
            x = 0.28125;
            y = 0.705;
            w = 0.173232;
            h = 0.113468;
            default = false;
        };
        class AccoladeCloseButton: XD_ButtonBase
        {
            text = "Close";
            action = "CloseDialog 0";
            x = 0.556875;
            y = 0.705;
            w = 0.16;
            h = 0.113468;
            default = true;
        };
    };
};