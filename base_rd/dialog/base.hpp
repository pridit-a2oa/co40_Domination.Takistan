// $[1.03,[[0,0,1,1],0.03125,0.025],[1200,"",[0,"\ca\ui\data\ui_background_armory_info_ca",[0.1875,0.225,0.841161,0.626407],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],""],[]],[1000,"",[0,"Research & Development",[0.203125,0.2125,0.27803,0.0982684],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],""],[]],[1701,"",[0,"Construct",[0.195549,0.65,0.190909,0.113853],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],""],[]],[1500,"",[0,"",[0.189393,0.287745,0.397293,0.379788],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],""],[]],[1100,"",[0,"",[0.588384,0.287013,0.218687,0.380519],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],""],[]],[1700,"",[0,"Close",[0.640625,0.65,0.161869,0.11039],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],""],[]],[1001,"",[0,"Resets:",[0.526199,0.2125,0.27803,0.0982684],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],""],[]],[1800,"",[0,"",[0.589646,0.287013,0.217424,0.123705],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],""],[]],[1801,"",[0,"",[0.589647,0.41342,0.217424,0.123705],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],""],[]],[1802,"",[0,"",[0.589646,0.541559,0.10948,0.127705],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],""],[]],[1201,"",[0,"#(argb,8,8,3)color(1,1,1,1)",[0.698232,0.541558,0.108217,0.127705],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],""],[]],[1002,"",[0,"",[0.589646,0.287013,0.217424,0.123705],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],""],[]],[1003,"",[0,"",[0.589647,0.41342,0.217424,0.123705],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],""],[]],[1004,"",[0,"",[0.589646,0.541559,0.10948,0.127705],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],""],[]]]
class XD_BaseRdDialog {
    idd = -1;
    movingEnable = 1;
    onLoad = "uiNamespace setVariable ['X_RD_DIALOG', _this select 0]";
    onUnLoad = "uiNamespace setVariable ['X_RD_DIALOG', nil]";
    objects[] = {};
    class controlsBackground {
        class RscBaseRdBackground: XD_RscPicture
        {
            text = "\ca\ui\data\ui_background_armory_info_ca";
            x = 0.1875;
            y = 0.225;
            w = 0.841161;
            h = 0.626407;
        };
        class RscBaseRdBackgroundInfo: BBRscStructuredText
        {
            x = 0.588384;
            y = 0.287013;
            w = 0.218687;
            h = 0.380519;
            colorBackground[] = {0.247,0.2,0.137,1};
        };
    };
    class controls {
        class RscBaseRdVehicleListbox: RscListbox
        {
            idc = 100;
            x = 0.189393;
            y = 0.287745;
            w = 0.397293;
            h = 0.379788;
            sizeEx = 0.023;
            rowHeight = 0.0632;
            style = CT_NO_BORDER + ST_LEFT;
            borderSize = 1;
            onLBSelChanged = "[_this select 1] call d_fnc_base_rd_switch";
        };
        class RscBaseRdVehiclePicture: XD_RscPicture
        {
            idc = 200;
            x = 0.698232;
            y = 0.541558;
            w = 0.108217;
            h = 0.127705;
            style = ST_MULTI + ST_TITLE_BAR + ST_KEEP_ASPECT_RATIO;
            colorText[] = {0.6,0.5,0.3,1};
        };
        class RscBaseRdResearchTimeText: X3_RscText
        {
            idc = 300;
            x = 0.589646;
            y = 0.293013; // 287013
            w = 0.217424;
            h = 0.123705;
            colorText[] = {0.6,0.5,0.3,1};
            font = "Bitstream";
            sizeEx = 0.045;
            style = ST_CENTER;
        };
        class RscBaseRdConstructTimeText: X3_RscText
        {
            idc = 400;
            x = 0.589647;
            y = 0.416342; // 41342
            w = 0.217424;
            h = 0.123705;
            colorText[] = {0.6,0.5,0.3,1};
            font = "Bitstream";
            sizeEx = 0.045;
            style = ST_CENTER;
        };
        class RscBaseRdProgressAmountText: X3_RscText
        {
            idc = 500;
            x = 0.589646;
            y = 0.547559; // 541559
            w = 0.10948;
            h = 0.127705;
            colorText[] = {0.6,0.5,0.3,1};
            font = "Bitstream";
            sizeEx = 0.045;
            style = ST_CENTER;
        };
        class RscBaseRdConstructShortcutButton: XD_ButtonBase
        {
            idc = 1000;
            text = "Construct";
            x = 0.195549;
            y = 0.65;
            w = 0.190909;
            h = 0.113853;
            action = "[((uiNamespace getVariable ""X_RD_DIALOG"") displayCtrl 100) lbData (lbCurSel 100)] spawn d_fnc_base_rd_construct";
        };
        class RscBaseRdCloseShortcutButton: XD_ButtonBase
        {
            text = "Close";
            x = 0.640625;
            y = 0.65;
            w = 0.161869;
            h = 0.11039;
            action = "closeDialog 0";
        };
        class RscBaseRdTitleText: X3_RscText
        {
            text = "Research & Development";
            x = 0.203125;
            y = 0.2125;
            w = 0.27803;
            h = 0.0982684;
            style = ST_LEFT;
        };
        class RcBaseRdResetText: X3_RscText
        {
            idc = 2000;
            x = 0.526199;
            y = 0.2125;
            w = 0.27803;
            h = 0.0982684;
            style = ST_RIGHT;
        };
        class RscBaseRdResearchFrame: RscFrame
        {
            text = "RESEARCH TIME (MM:SS)";
            x = 0.589646;
            y = 0.287013;
            w = 0.217424;
            h = 0.123705;
            colorText[] = {0.639,0.576,0.427,1};
        };
        class RscBaseRdConstructFrame: RscFrame
        {
            text = "CONSTRUCT TIME (MM:SS)";
            x = 0.589647;
            y = 0.41342;
            w = 0.217424;
            h = 0.123705;
            colorText[] = {0.639,0.576,0.427,1};
        };
        class RscBaseRdProgressFrame: RscFrame
        {
            text = "PROGRESS";
            x = 0.589646;
            y = 0.541559;
            w = 0.10948;
            h = 0.127705;
            colorText[] = {0.639,0.576,0.427,1};
        };
    };
};
