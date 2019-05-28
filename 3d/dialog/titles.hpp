class XD_3DText {
    idd = -1;
    movingEnable = 1;
    duration = 1e+011;
    fadein = 0;
    fadeout = 0;
    onload = "uiNamespace setVariable ['d_BIS_dynamicText', _this select 0];";
    onUnload = "uiNamespace setVariable ['d_BIS_dynamicText', nil];";
    class controls {
        class Text: BBRscStructuredText {
            idc = 1;
            style = "1 + 16";
            text = "";
            x = 0;
            y = 0.45;
            w = 1;
            h = 10000;
            colorText[] = {1,1,1,1};
            colorBackground[] = {0,0,0,0};
            size = "(0.05 / 1.17647) * safezoneH";
            sizeEx = 0.4;
            class Attributes {
                font = "TahomaB";
                color = "#ffffff";
                align = "center";
                shadow = 0;
                valign = "top";
            };
        };
    };
};