class XD_InventoryDialog {
    idd = -1;
    movingEnable = 1;
    onLoad = "uiNamespace setVariable ['X_INVENTORY_DIALOG', _this select 0]";
    onUnLoad = "uiNamespace setVariable ['X_INVENTORY_DIALOG', nil]";
    objects[] = {};
    class controlsBackground {
        class PictureBackground: XD_RscPicture
        {
            text = "\ca\ui\data\ui_revert_background_ca";
            x = 0.296875;
            y = 0.25;
            w = 0.513889;
            h = 0.548316;
        };
    };
    class controls {
        #include "partial\background.hpp"
        #include "partial\overlay.hpp"
        #include "partial\image.hpp"
        #include "partial\slot.hpp"
        class TextTitle: X3_RscText
        {
            text = "Inventory";
            x = 0.291869;
            y = 0.242424;
            w = 0.140625;
            h = 0.075;
        };
        class ButtonClose: XD_ButtonBase
        {
            text = "Close";
            action = "CloseDialog 0";
            x = 0.527936;
            y = 0.61532;
            w = 0.166919;
            h = 0.111785;
        };
    };
};
