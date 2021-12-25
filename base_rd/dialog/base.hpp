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
            x = 0.280303;
            y = 0.311448;
            w = 0.323485;
            h = 0.350842;
            sizeEx = 0.023;
            rowHeight = 0.05;
            style = CT_NO_BORDER + ST_LEFT;
            borderSize = 1;
            onMouseButtonUp = "";
            onLBSelChanged = "[_this select 1] call d_fnc_base_rd_switch";
            onLBDblClick = "";
        };
        class RscBaseRdVehiclePicture: XD_RscPicture
        {
            idc = 200;
            text = "";
            x = 0.623737;
            y = 0.537037;
            w = 0.0949496;
            h = 0.123569;
            style = ST_MULTI + ST_TITLE_BAR + ST_KEEP_ASPECT_RATIO;
            colorText[] = {0.6,0.5,0.3,1};
        };
        class RscBaseRdProgressAmountText: X3_RscText
        {
            idc = 300;
            text = "";
            x = 0.636363;
            y = 0.3367;
            w = 0.072222;
            h = 0.0545455;
            style = ST_CENTER;
        };
        class RscBaseRdTimeAmountText: X3_RscText
        {
            idc = 400;
            text = "40:00";
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
            x = 0.626264;
            y = 0.313131;
            w = 0.092424;
            h = 0.0915827;
        };
        class RscBaseRdTimeFrame: RscFrame
        {
            text = "Time";
            x = 0.626262;
            y = 0.414142;
            w = 0.092424;
            h = 0.0915827;
        };
    };
};