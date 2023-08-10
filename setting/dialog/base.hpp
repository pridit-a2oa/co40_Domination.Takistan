// $[1.03,[[0,0,1,1],0.03125,0.05],[1200,"",[0,"\ca\ui\data\ui_revert_background_ca",[0.26925,0.182467,0.596502,0.75265],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],""],[]],[1500,"",[0,"",[0.273162,0.257024,0.184041,0.457485],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],""],[]],[1000,"",[0,"",[0.494476,0.358671,0.178788,0.0393939],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],""],[]],[2100,"",[0,"",[0.498263,0.415152,0.1875,0.05],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],""],[]],[1900,"",[0,"",[0.498264,0.415152,0.1875,0.05],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],""],[]],[1100,"",[0,"",[0.456888,0.607532,0.276788,0.108562],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],""],[]],[1001,"",[0,"",[0.499528,0.390152,0.1875,0.1],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],""],[]],[1002,"",[0,"Saves",[0.513253,0.496309,0.0873737,0.0292927],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],""],[]],[1201,"",[0,"#(argb,8,8,3)color(1,1,1,1)",[0.498949,0.492574,0.03,0.04],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],""],[]],[1003,"",[0,"Settings",[0.286263,0.207262,0.101263,0.0393939],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],""],[]],[1700,"",[0,"Close",[0.558079,0.706161,0.160038,0.111785],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],""],[]]]
class XD_SettingDialog {
    idd = 1000;
    movingEnable = 1;
    onLoad = "uiNamespace setVariable ['X_SETTING_DIALOG', _this select 0]";
    onUnLoad = "uiNamespace setVariable ['X_SETTING_DIALOG', nil];if (!isNil ""d_mdl_profile"") then {saveProfileNamespace}";
    objects[] = {};
    class controlsBackground {
        class PictureBackground: XD_RscPicture
        {
            text = "ca\ui\data\ui_revert_background_ca";
            x = 0.26925;
            y = 0.182467;
            w = 0.596502;
            h = 0.75265;
        };
    };
    class controls {
        class List: RscListBox
        {
            idc = 100;
            x = 0.273162;
            y = 0.257024;
            w = 0.184041;
            h = 0.457485;
            sizeEx = 0.025;
            rowHeight = 0.0454;
            onLBSelChanged = "call d_fnc_setting_switch";
        };
        class TextCaption: X3_RscText
        {
            idc = 200;
            x = 0.494476;
            y = 0.358671;
            w = 0.178788;
            h = 0.0393939;
            style = ST_LEFT;
        };
        class Combo: XD_UIComboBox
        {
            idc = 300;
            x = 0.498263;
            y = 0.415152;
            w = 0.1875;
            h = 0.05;
            onLBSelChanged = "[_this, 300] call d_fnc_setting_set";
        };
        class Slider: XC_SliderH
        {
            idc = 400;
            x = 0.498264;
            y = 0.415152;
            w = 0.1875;
            h = 0.05;
            onSliderPosChanged = "[_this, 400] call d_fnc_setting_set";
        };
        class TextDescription: BBRscStructuredText
        {
            idc = 500;
            x = 0.456888;
            y = 0.607532;
            w = 0.276788;
            h = 0.108562;
            size = 0.025;
            colorBackground[] = {0.173, 0.157, 0.094, 0.75};
        };
        class TextValue: X3_RscText
        {
            idc = 600;
            x = 0.499528;
            y = 0.390152;
            w = 0.1875;
            h = 0.1;
            size = 0.025;
            style = ST_CENTER;
        };
        class TextSave: X3_RscText
        {
            idc = 700;
            x = 0.513253;
            y = 0.496309;
            w = 0.0873737;
            h = 0.0292927;
            size = 0.001;
        };
        class PictureSave: XD_RscPicture
        {
            idc = 800;
            x = 0.498949;
            y = 0.492574;
            w = 0.03;
            h = 0.04;
        };
        class TextTitle: X3_RscText
        {
            text = "Settings";
            x = 0.286263;
            y = 0.207262;
            w = 0.101263;
            h = 0.0393939;
        };
        class ButtonClose: XD_ButtonBase
        {
            text = "Close";
            x = 0.558079;
            y = 0.706161;
            w = 0.160038;
            h = 0.111785;
            action = "CloseDialog 0";
        };
    };
};