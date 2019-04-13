class XD_VehicleHudDialog {
    idd = -1;
    movingEnable = true;
    fadein = 0;
    fadeout = 0;
    duration = 1e+011;
    name="chopper_lift_hud";
    onLoad="uiNamespace setVariable ['XD_VEHICLE_HUD_DIALOG', _this select 0]";
    onUnLoad="uiNamespace setVariable ['XD_VEHICLE_HUD_DIALOG', nil]";
    class controls {
        class chopper_hud_background {
            idc = 64437;
            type = 0;
            XCTextBlack;
            font = "Bitstream";
            colorBackground[] = {0, 0.3, 0, 0.1};
            text = "";
            style = 128;
            sizeEx = 0.015;
            x = 0.3;y = 0.4;w = 0.42;h = 0.4;
        };
        class chopper_hud_type {
            type = 0;
            idc = 64438;
            style = 0;
            x = 0.31;y = 0.73;w = 0.42;h = 0.1;
            font = "Zeppelin32";
            sizeEx = 0.02;
            XCTextHud;
            colorBackground[]={0,0,0,0};
            text = "";
            shadow = 2;
        };
        class chopper_hud_icon: chopper_hud_type {
            idc = 64439;
            style = 48;
            x = 0.62;y = 0.723;w = 0.083;h = 0.07;
        };
        class chopper_hud_edge: chopper_hud_type {
            idc = 64440;
            x = 0.1;
            y = "SafeZoneY + 0.02";
            w = 0.42;h = 0.1;
        };
        class chopper_hud_dist: chopper_hud_type {
            idc = 64441;
            x = 0.31;y = 0.37;w = 0.25;h = 0.1;
        };
        class chopper_hud_height: chopper_hud_type {
            idc = 64442;
            x = 0.6;y = 0.37;w = 0.2;h = 0.1;
        };
        class chopper_hud_back: chopper_hud_type {
            idc = 64443;
            style = 48;
            x = 0.45;y = 0.6;w = 0.1;h = 0.1;
        };
        class chopper_hud_forward: chopper_hud_type {
            idc = 64444;
            style = 48;
            x = 0.45;y = 0.5;w = 0.1;h = 0.1;
        };
        class chopper_hud_left: chopper_hud_type {
            idc = 64445;
            style = 48;
            x = 0.4;y = 0.55;w = 0.1;h = 0.1;
        };
        class chopper_hud_right: chopper_hud_type {
            idc = 64446;
            style = 48;
            x = 0.5;y = 0.55;w = 0.1;h = 0.1;
        };
        class chopper_hud_middle: chopper_hud_type {
            idc = 64447;
            style = 48;
            x = 0.45;y = 0.55;w = 0.1;h = 0.1;
        };
        class chopper_hud_icon2: chopper_hud_type {
            idc = 64448;
            style = 48;
            x = 0.458;y = 0.56;w = 0.083;h = 0.07;
        };
    };
};