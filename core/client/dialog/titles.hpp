class XD_Notice {
    idd = -1;
    movingEnable = 1;
    duration = 1e+011;
    onload = "uiNamespace setVariable ['d_notice', _this select 0];";
    onUnload = "uiNamespace setVariable ['d_notice', nil];";
    class controls {
        class RscPicture_1200: XD_RscPicture
        {
            text = "\ca\ui\data\gunner_lock";
            x = 0.421875;
            y = 0.375;
            w = 0.15625;
            h = 0.2;
        };
        class TextTitle: X3_RscText
        {
            idc = 1000;
            text = "";
            x = 0.3125;
            y = 0.225;
            w = 0.370202;
            h = 0.152189;
            style = ST_CENTER;
        };
        class TextAddendum: BBRscStructuredText
        {
            idc = 1001;
            text = "";
            x = 0.3;
            y = 0.65;
            w = 0.4;
            h = 0.2;
            style = ST_CENTER;
        };
        class TextCountdown: BBRscStructuredText
        {
            idc = 1002;
            text = "";
            x = 0.452651;
            y = 0.433165;
            w = 0.0936869;
            h = 0.086532;
            style = ST_CENTER;
        };
    };
};