class XD_Notice {
    idd = -1;
    movingEnable = 1;
    duration = 1e+011;
    onload = "uiNamespace setVariable ['d_notice', _this select 0];";
    onUnload = "uiNamespace setVariable ['d_notice', nil];";
    class controls {        
        class RscStructuredText_1101: BBRscStructuredText
        {
            idc = 1000;
            text = "";
            x = 0.3125;
            y = 0.275;
            w = 0.377525;
            h = 0.116583;
            size = 0.05;
        };
        class RscStructuredText_1100: BBRscStructuredText
        {
            idc = 1001;
            x = 0.25;
            y = 0.6;
            w = 0.501263;
            h = 0.126684;
            size = 0.034;
        };
        class RscText_1000: BBRscStructuredText
        {
            idc = 1002;
            text = "";
            x = 0.316288;
            y = 0.4;
            w = 0.368939;
            h = 0.190909;
            size = 0.14;
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