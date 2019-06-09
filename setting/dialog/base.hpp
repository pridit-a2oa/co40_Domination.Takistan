class XD_SettingDialog {
    idd = -1;
    movingEnable = 1;
    onLoad = "uiNamespace setVariable ['X_SETTING_DIALOG', _this select 0]";
    onUnLoad = "uiNamespace setVariable ['X_SETTING_DIALOG', nil]";
    objects[] = {};
    class controlsBackground {
        class PictureBackground: XD_RscPicture
        {
            text = "ca\ui\data\ui_revert_background_ca";
            x = 0.296875;
            y = 0.15;
            w = 0.505524;
            h = 0.756734;
        };
    };
    class controls {
        #include "partial\caption.hpp"
        #include "partial\combo.hpp"
        #include "partial\slider.hpp"
        class TextTitle: X3_RscText
        {
            text = "Settings";
            x = 0.311869;
            y = 0.143097;
            w = 0.1;
            h = 0.1;
        };
        class ButtonClose: XD_ButtonBase
        {
            text = "Close";
            action = "CloseDialog 0";
            x = 0.516212;
            y = 0.678367;
            w = 0.165088;
            h = 0.111784;
        };
    };
};