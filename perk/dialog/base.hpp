class XD_PerkDialog {
    idd = -1;
    movingEnable = 1;
    onLoad = "uiNamespace setVariable ['X_PERK_DIALOG', _this select 0];d_perk_dialog_open = true";
    onUnLoad = "uiNamespace setVariable ['X_PERK_DIALOG', nil];d_perk_dialog_open = false";
    objects[] = {};
    class controlsBackground {
        class PerksDialogBackground: XD_RscPicture
        {
            text = "ca\ui\data\ui_background_controls_ca.paa";
            x = 0.265624;
            y = -2.98023e-008;
            w = 0.596213;
            h = 1.00236;
        };
        class PerksDialogBackgroundColor: XC_RscText
        {
            x = 0.26751;
            y = 0.101011;
            w = 0.461276;
            h = 0.768351;
            colorBackground[] = {0.247,0.2,0.137,0.5};
        };
    };
    class controls {
        #include "partial\icons\background.hpp"
        #include "partial\button.hpp"
        #include "partial\bar.hpp"
        #include "partial\icons\image.hpp"
        #include "partial\icons\overlay.hpp"
        class MenuText: X3_RscText
        {
            text = "Perks";
            x = 0.267878;
            y = 0.0420879;
            w = 0.0879105;
            h = 0.0348484;
        };
        class AvailablePointsText: X3_RscText
        {
            text = "Available Points:";
            x = 0.504878;
            y = 0.0420879;
            w = 0.196496;
            h = 0.0348484;
        };
        class AvailablePointsValue : X3_RscText {
            idc = 1;
            x = 0.680878;
            y = 0.0420879;
            w = 0.0374055;
            h = 0.0348484;
        };
        class CloseButton: XD_ButtonBase
        {
            text = "Close";
            action = "CloseDialog 0";
            x = 0.547506;
            y = 0.86894;
            w = 0.163131;
            h = 0.113468;
        };
        class DudButton: XD_ButtonBase
        {
            action = "";
            default = true;
            x = 0;
            y = 0;
            w = 0;
            h = 0;
        };
        class HelpText: X3_RscText
        {
            idc = 10;
            style = ST_MULTI;
            x = 0.275;
            y = 0.885;
            w = 0.25;
            h = 0.1;
            lineSpacing = 1;
            sizeEx = 0.028;
        };
        class HolidayText: X3_RscText
        {
            idc = 20;
            style = ST_MULTI + ST_CENTER;
            x = 0.275;
            y = 0.885;
            w = 0.25;
            h = 0.1;
            lineSpacing = 1;
            sizeEx = 0.028;
        };
    };
};