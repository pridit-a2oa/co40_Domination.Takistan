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
            text = "\ca\ui\data\ui_background_modlauncher_ca";
            x = 0.281251;
            y = 0.225;
            w = 0.670771;
            h = 0.60202;
        };
    };
    class controls {
        class RscPicture_1200: XD_RscPicture
        {
            idc = 1200;
            text = "\ca\ui\data\ui_background_modlauncher_ca";
            x = 0.281251;
            y = 0.225;
            w = 0.670771;
            h = 0.60202;
        };
        class RscPicture_1201: XD_RscPicture
        {
            idc = 1201;
            x = 0.625;
            y = 0.525;
            w = 0.0705493;
            h = 0.103367;
            colorText[] = {0.6,0.5,0.3,1};
        };
        class RscPicture_1202: XD_RscPicture
        {
            idc = 1202;
            x = 0.308125;
            y = 0.475;
            w = 0.265953;
            h = 0.213367;
            colorText[] = {0.5,0.5,0.5,0.3};
        };
        class RscText_1000: X3_RscText
        {
            idc = 1000;
            x = 0.295875;
            y = 0.222;
            w = 0.171875;
            h = 0.075;
            style = ST_LEFT;
        };
        class RscShortcutButton_1700: XD_ButtonBase
        {
            idc = 1700;
            text = "OK";
            action = "closeDialog 0"
            x = 0.537721;
            y = 0.630219;
            w = 0.171402;
            h = 0.113468;
        };
        class RscListbox_1500: RscListBox
        {
            idc = 1500;
            x = 0.3125;
            y = 0.325;
            w = 0.380;
            h = 0.15;
            sizeEx = 0.023;
            rowHeight = 0.05;
            style = ST_LEFT;
            borderSize = 1;
        };
    };
};