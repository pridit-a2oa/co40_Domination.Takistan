// $[1.03,[[0,0,1,1],0.03125,0.05],[1200,"",[0,"\ca\ui\data\ui_background_modlauncher_ca",[0.270204,0.244108,0.711109,0.600001],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],""],[]],[1500,"",[0,"",[0.272727,0.303058,0.331111,0.364695],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],""],[]],[1201,"",[0,"#(argb,8,8,3)color(1,1,1,1)",[0.618687,0.538721,0.102525,0.115151],[0.6,0.5,0.3,1],[-1,-1,-1,-1],[-1,-1,-1,-1],""],[]],[1000,"",[0,"",[0.636364,0.3367,0.072222,0.0545455],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],""],[]],[1001,"",[0,"",[0.636364,0.437711,0.072222,0.0545455],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],""],[]],[1700,"",[0,"Construct",[0.545455,0.649831,0.179924,0.110354],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],""],[]],[1701,"",[0,"Close",[0.277455,0.649831,0.179924,0.110354],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],""],[]],[1002,"",[0,"Research & Development",[0.264091,0.260943,0.276768,0.034343],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],""],[]],[1800,"",[0,"Progress",[0.626262,0.313131,0.092424,0.0915827],[0.8784,0.8471,0.651,1],[-1,-1,-1,-1],[-1,-1,-1,-1],""],[]],[1801,"",[0,"Time",[0.626262,0.414142,0.092424,0.0915827],[0.8784,0.8471,0.651,1],[-1,-1,-1,-1],[-1,-1,-1,-1],""],[]]]
class XD_BaseRdDialog {
    idd = -1;
    movingEnable = 1;
    onLoad = "uiNamespace setVariable ['X_RD_DIALOG', _this select 0]";
    onUnLoad = "uiNamespace setVariable ['X_RD_DIALOG', nil]";
    objects[] = {};
    class controlsBackground {
        class RscPicture_1200: XD_RscPicture
        {
            text = "\ca\ui\data\ui_background_modlauncher_ca";
            x = 0.270204;
            y = 0.244108;
            w = 0.711109;
            h = 0.600001;
        };
    };
    class controls {
        class RscBaseRdVehicleListbox: RscListbox
        {
            idc = 100;
            x = 0.272727;
            y = 0.303058;
            w = 0.331111;
            h = 0.364695;
            sizeEx = 0.023;
            rowHeight = 0.06;
            style = CT_NO_BORDER + ST_LEFT;
            borderSize = 1;
            onLBSelChanged = "[_this select 1] call d_fnc_base_rd_switch";
        };
        class RscBaseRdVehiclePicture: XD_RscPicture
        {
            idc = 200;
            text = "";
            x = 0.618687;
            y = 0.538721;
            w = 0.102525;
            h = 0.115151;
            style = ST_MULTI + ST_TITLE_BAR + ST_KEEP_ASPECT_RATIO;
            colorText[] = {0.6,0.5,0.3,1};
        };
        class RscBaseRdProgressAmountText: X3_RscText
        {
            idc = 300;
            text = "";
            x = 0.636364;
            y = 0.3367;
            w = 0.072222;
            h = 0.0545455;
            style = ST_CENTER;
        };
        class RscBaseRdTimeAmountText: X3_RscText
        {
            idc = 400;
            text = "";
            x = 0.636364;
            y = 0.437711;
            w = 0.072222;
            h = 0.0545455;
            style = ST_CENTER;
        };
        class RscBaseRdConstructShortcutButton: XD_ButtonBase
        {
            idc = 500;
            text = "Construct";
            x = 0.545455;
            y = 0.649831;
            w = 0.179924;
            h = 0.110354;
            action = "[((uiNamespace getVariable ""X_RD_DIALOG"") displayCtrl 100) lbData (lbCurSel 100)] spawn d_fnc_base_rd_construct";
        };
        class RscBaseRdCloseShortcutButton: XD_ButtonBase
        {
            text = "Close";
            x = 0.277455;
            y = 0.649831;
            w = 0.179924;
            h = 0.110354;
            action = "closeDialog 0";
        };
        class RscBaseRdTitleText: X3_RscText
        {
            text = "Research & Development";
            x = 0.264091;
            y = 0.260943;
            w = 0.276768;
            h = 0.034343;
        };
        class RscBaseRdProgessFrame: RscFrame
        {
            text = "Progress";
            x = 0.626262;
            y = 0.313131;
            w = 0.092424;
            h = 0.0915827;
            colorText[] = {0.8784,0.8471,0.651,1};
        };
        class RscBaseRdTimeFrame: RscFrame
        {
            text = "Time";
            x = 0.626262;
            y = 0.414142;
            w = 0.092424;
            h = 0.0915827;
            colorText[] = {0.8784,0.8471,0.651,1};
        };
    };
};