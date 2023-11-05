class XD_HaloDialog {
    idd = -1;
    movingEnable = false;
    objects[] = {};
    onLoad="uiNamespace setVariable ['X_HALO_DIALOG', _this select 0]";
    onUnLoad="uiNamespace setVariable ['X_HALO_DIALOG', nil]";
    class controlsBackground {
        class RscHaloBackground: XD_RscPicture
        {
            idc = 1200;
            text = "ca\ui\data\ui_armory_background_ca";
            x = 0.0156243;
            y = 0.15;
            w = 1.23438;
            h = 0.825;
        };
    };
    class controls {
        class RscHaloMapControl: XD_RscMapControl
        {
            idc = 10000;
            x = 0.0211491;
            y = 0.231735;
            w = 0.955858;
            h = 0.501853;
            onMouseButtonDblClick = "player setPos ((_this select 0) ctrlMapScreenToWorld [_this select 2, _this select 3]);[1500] call d_fnc_halo_jump;closeDialog 0";
        };
        class RscHaloButtonClose: XD_ButtonBase
        {
            x = 0.794849;
            y = 0.72744;
            w = 0.167627;
            h = 0.113468;
            text = "Close";
            action = "closeDialog 0";
        };
        class RscHaloTextTitle: X3_RscText
        {
            x = 0.0328292;
            y = 0.148153;
            w = 0.2;
            h = 0.1;
            text = "HALO Jump";
            style = ST_LEFT;
        };
        class RscHaloTextGuide: X3_RscText
        {
            x = 0.0328292;
            y = 0.748;
            w = 0.6;
            h = 0.09;
            text = "Double left-click anywhere on the map to initiate a HALO jump.\nRight-click and drag to pan. Scroll wheel to adjust zoom.";
            style = ST_MULTI;
            lineSpacing = 1;
        };
    };
};