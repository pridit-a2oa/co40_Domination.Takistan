class XD_Awarded {
    idd = -1;
    movingEnable = 1;
    duration = 6;
    fadein = 1;
    fadeout = 1;
    onload = "uiNamespace setVariable ['X_AWARD_DIALOG', _this select 0];";
    onUnload = "uiNamespace setVariable ['X_AWARD_DIALOG', nil];";
    class controls {
        class RscPicture_1200: XD_RscPicture
        {
            idc = 1200;
            text = "\ca\ui\data\gunner_lock";
            x = 0.453125;
            y = 0.3;
            w = 0.09375;
            h = 0.125;
        };
        class RscText_1000: X3_RscText
        {
            idc = 1000;
            text = "You have been rewarded perk points";
            x = 0.303662;
            y = 0.38;
            w = 0.387311;
            h = 0.2;
            style = ST_CENTER;
        };
        class RscText_1001: X3_RscText
        {
            idc = 1001;
            text = "";
            x = 0.478115;
            y = 0.313215;
            w = 0.0457071;
            h = 0.1;
            sizeEx = 0.038;
            style = ST_CENTER;
        };
    };
};