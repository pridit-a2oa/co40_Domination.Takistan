class XD_ChatDialog {
    idd = -1;
    movingEnable = 0;
    duration = 1e+011;
    fadein = 0;
    fadeout = 0;
    onLoad = "uiNamespace setVariable ['X_CHAT_DIALOG', _this select 0];";
    onUnload = "uiNamespace setVariable ['X_CHAT_DIALOG', displayNull];";
    class controlsBackground {
        class RscPicture_1200: XD_RscPicture
        {
            idc = 1000;
            x = "SafeZoneX + 0.268";
            y = "(SafeZoneH + SafeZoneY) - 0.034";
            w = 0.025;
            h = 0.034;
            sizeEx = 0.034;
            colorText[] = {0.773, 0.29, 0.188, 1};
        };
    };
    class controls {
        class RscChatTextNotice: XC_RscText
        {
            idc = 100;
            x = "SafeZoneX + 0.29";
            y = "(SafeZoneH + SafeZoneY) - 0.034";
            w = "SafeZoneW - 0.26 - 0.015";
            h = 0.034;
            sizeEx = 0.034;
            font = "Zeppelin32";
            colorText[] = {0.773, 0.29, 0.188, 1};
            colorBackground[] = {0, 0, 0, 0};
        };
    };
};