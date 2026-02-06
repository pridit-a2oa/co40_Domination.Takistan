// $[1.03,[[0,0,1,1],0.01125,0.01],[1200,"",[0,"ca\ui\data\ui_background_controls_ca.paa",[0.275726,0.195238,0.577274,0.611018],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],""],[]],[1201,"",[0,"ca\ui\data\ui_background_video_buttons_ca",[0.271464,0.369805,0.572387,0.099953],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],""],[]],[1500,"",[0,"",[0.276199,0.418074,0.233839,0.304329],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],""],[]],[1900,"",[0,"",[0.343125,0.28,0.318434,0.0290044],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],""],[]],[1701,"",[0,"Overview",[0.28125,0.705,0.173232,0.113468],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],""],[]],[1700,"",[0,"Close",[0.556875,0.705,0.16,0.113468],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],""],[]],[1204,"",[0,"\ca\warfare2\Images\rank_private",[0.2925,0.27,0.0369696,0.0463203],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],""],[]],[1202,"",[0,"\ca\warfare2\Images\rank_private",[0.675,0.27,0.0369696,0.0463203],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],""],[]],[1001,"",[0,"200",[0.661225,0.31,0.0633839,0.0584416],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],""],[]],[1002,"",[0,"Accolades",[0.28125,0.205,0.116414,0.0549783],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],""],[]],[1003,"",[0,"Discipline",[0.28125,0.365,0.116414,0.0549783],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],""],[]],[1004,"",[0,"0",[0.466875,0.31,0.0659091,0.0584416],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],""],[]],[1000,"",[0,"100",[0.279988,0.31,0.0633839,0.0584416],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],""],[]]]
class XD_AccoladeDialog {
    idd = -1;
    movingEnable = false;
    objects[] = {};
    onLoad="uiNamespace setVariable ['X_ACCOLADE_DIALOG', _this select 0]";
    onUnLoad="uiNamespace setVariable ['X_ACCOLADE_DIALOG', nil]";
    class controlsBackground {
        class AccoladeBackgroundPicture: XD_RscPicture
        {
            text = "ca\ui\data\ui_background_controls_ca.paa";
            x = 0.275726;
            y = 0.195238;
            w = 0.577274;
            h = 0.611018;
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
        class AccoladeTitleText: X3_RscText
        {
            text = "Accolades";
            x = 0.28125;
            y = 0.205;
            w = 0.116414;
            h = 0.0549783;
            style = ST_LEFT;
        };
        class AccoladeDividerDisciplineText: X3_RscText
        {
            idc = 1003;
            text = "Combat";
            x = 0.28125;
            y = 0.365;
            w = 0.116414;
            h = 0.0549783;
            style = ST_LEFT;
        };
        class AccoladeRankCurrentPicture: XD_RscPicture
        {
            text = "\ca\warfare2\Images\rank_private";
            x = 0.2925;
            y = 0.27;
            w = 0.0369696;
            h = 0.0463203;
            colorText[] = {0.89,0.804,0.365,1};
        };
        class AccoladeRankNextPicture: XD_RscPicture
        {
            text = "\ca\warfare2\Images\rank_major";
            x = 0.675;
            y = 0.27;
            w = 0.0369696;
            h = 0.0463203;
            colorText[] = {0.89,0.804,0.365,1};
        };
        class AccoladeBackgroundRankProgressBar: RscProgressBar
        {
            onLoad = "((_this select 0) select 0) progressSetPosition 1;"
            idc = 999;
            x = 0.343125;
            y = 0.28;
            w = 0.318434;
            h = 0.0290044;
            colorFrame[] = {1,1,1,0};
            colorBar[] = {0.208,0.173,0.137,0.5};
        };
        class AccoladeRankProgressBar: RscProgressBar
        {
            idc = 1000;
            x = 0.343125;
            y = 0.28;
            w = 0.318434;
            h = 0.0290044;
            colorFrame[] = {1,1,1,0};
            colorBar[] = {0.639,0.576,0.427,1};
        };
        class AccoladeTaskListbox: RscListBox
        {
            idc = 2000;
            x = 0.276199;
            y = 0.418074;
            w = 0.233839;
            h = 0.304329;
            sizeEx = 0.027;
            rowHeight = 0.0609;
            borderSize = 1;
            onLBSelChanged = "";
        };
        class RscXPPreviousAmountText: X3_RscText
        {
            text = "0";
            x = 0.279988;
            y = 0.31;
            w = 0.0633839;
            h = 0.0584416;
            style = ST_CENTER;
        };
        class RscXPCurrentAmountText: X3_RscText
        {
            text = "0";
            x = 0.466875;
            y = 0.31;
            w = 0.0659091;
            h = 0.0584416;
            style = ST_CENTER;
        };
        class RscXPNextAmountText: X3_RscText
        {
            text = "0";
            x = 0.661225;
            y = 0.31;
            w = 0.0633839;
            h = 0.0584416;
            style = ST_CENTER;
        };
        class AccoladeOverviewButton: XD_ButtonBase
        {
            text = "Overview";
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
            default = false;
        };
    };
};
