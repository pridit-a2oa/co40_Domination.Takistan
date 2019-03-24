class XD_VehicleHudDialog {
    idd = -1;
    movingEnable = true;
    fadein = 1;
    fadeout = 1;
    duration = 11;
    onLoad = "uiNamespace setVariable ['X_VEHICLE_WELCOME_DIALOG', _this select 0]";
    onUnLoad = "uiNamespace setVariable ['X_VEHICLE_WELCOME_DIALOG', nil]";
    objects[] = {};
    class controls {
        class RscText_1000: X3_RscText
        {
            idc = 1000;
            text = "Load ammobox";
            x = 0.460;
            y = 0.325;
            w = 0.203125;
            h = 0.075;
            sizeEx = 0.035;
            style = ST_LEFT;
        };
        class RscText_1001: X3_RscText
        {
            idc = 1001;
            text = "Lift vehicles";
            x = 0.460;
            y = 0.45;
            w = 0.203125;
            h = 0.075;
            sizeEx = 0.035;
            style = ST_LEFT;
        };
        class RscText_1002: X3_RscText
        {
            idc = 1002;
            text = "Lift wrecks";
            x = 0.460;
            y = 0.575;
            w = 0.203125;
            h = 0.075;
            sizeEx = 0.035;
            style = ST_LEFT;
        };
        class RscPicture_1200: XD_RscPicture
        {
            idc = 1003;
            text = "\ca\ui\data\igui_sidebriefing_opfor_ca"; // igui_sidebriefing_opfor_ca | igui_sidebriefing_indep_ca
            x = 0.375001;
            y = 0.325;
            w = 0.0624999;
            h = 0.075;
        };
        class RscPicture_1201: XD_RscPicture
        {
            idc = 1004;
            text = "\ca\ui\data\igui_sidebriefing_opfor_ca";
            x = 0.375001;
            y = 0.45;
            w = 0.0624999;
            h = 0.075;
        };
        class RscPicture_1202: XD_RscPicture
        {
            idc = 1005;
            text = "\ca\ui\data\igui_sidebriefing_opfor_ca";
            x = 0.375001;
            y = 0.575;
            w = 0.0624999;
            h = 0.075;
        };
    };
};