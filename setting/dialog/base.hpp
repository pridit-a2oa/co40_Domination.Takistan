class XD_SettingDialog {
    idd = 1000;
    movingEnable = 1;
    onLoad = "uiNamespace setVariable ['X_SETTING_DIALOG', _this select 0]";
    onUnLoad = "uiNamespace setVariable ['X_SETTING_DIALOG', nil];if (!isNil ""d_mdl_profile"") then {saveProfileNamespace}";
    objects[] = {};
    class controlsBackground {
        class PictureBackground: XD_RscPicture
        {
            text = "\ca\ui\data\ui_wiz_background_ca";
            x = 0.28125;
            y = 0.25;
            w = 0.591856;
            h = 0.551785;
        };
    };
    class controls {
        class List: RscListBox
        {
            idc = 100;
            x = 0.282;
            y = 0.304;
            w = 0.162;
            h = 0.336;
            sizeEx = 0.025;
            rowHeight = 0.042;
            onLBSelChanged = "call d_fnc_setting_switch";
        };
        class TextCaption: X3_RscText
        {
            idc = 200;
            text = "";
            x = 0.48185;
            y = 0.308165;
            w = 0.3;
            h = 0.1;
            style = ST_LEFT;
        };
        class Combo: XD_UIComboBox
        {
            idc = 300;
            x = 0.484375;
            y = 0.4;
            w = 0.1875;
            h = 0.05;
            onLBSelChanged = "[_this, 300] call d_fnc_setting_set";
        };
        class Slider: XC_SliderH
        {
            idc = 400;
            x = 0.484375;
            y = 0.4;
            w = 0.1875;
            h = 0.05;
            onSliderPosChanged = "[_this, 400] call d_fnc_setting_set";
        };
        class TextDescription: BBRscStructuredText
        {
            idc = 500;
            text = "";
            x = 0.443;
            y = 0.540;
            w = 0.273;
            h = 0.100;
            size = 0.025;
            colorBackground[] = {0.173, 0.157, 0.094, 1};
        };
        class TextValue: X3_RscText
        {
            idc = 600;
            text = "";
            x = 0.484376;
            y = 0.375;
            w = 0.1875;
            h = 0.1;
            size = 0.025;
            style = ST_CENTER;
        };
        class TextSave: X3_RscText
        {
            idc = 700;
            text = "";
            x = 0.303656;
            y = 0.622263;
            w = 0.1;
            h = 0.1;
            size = 0.001;
        };
        class PictureSave: XD_RscPicture
        {
            idc = 800;
            text = "";
            x = 0.293141;
            y = 0.655249;
            w = 0.03;
            h = 0.04;
        };
        class TextTitle: X3_RscText
        {
            text = "Settings";
            x = 0.285;
            y = 0.23064;
            w = 0.1;
            h = 0.1;
        };
        class ButtonClose: XD_ButtonBase
        {
            text = "Close";
            action = "CloseDialog 0";
            x = 0.546717;
            y = 0.617946;
            w = 0.160038;
            h = 0.111785;
        };
    };
};
