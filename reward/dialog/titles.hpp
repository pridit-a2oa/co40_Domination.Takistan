class XD_Reward {
    idd = -1;
    movingEnable = 1;
    duration = 10;
    fadein = 1;
    fadeout = 1;
    onload = "uiNamespace setVariable ['X_REWARD_DIALOG', _this select 0];";
    onUnload = "uiNamespace setVariable ['X_REWARD_DIALOG', nil];";
    class controls {
        class RscRewardBorderPicture: XD_RscPicture
        {
            idc = 100;
            text = "ca\ui\data\gunner_lock";
            x = 0.46212;
            y = 0.0303037;
            w = 0.0772728;
            h = 0.105051;
        };
        class RscRewardAmountText: X3_RscText
        {
            idc = 200;
            text = "";
            x = 0.48106;
            y = 0.0538717;
            w = 0.0393938;
            h = 0.0612794;
            sizeEx = 0.038;
            style = ST_CENTER;
        };
        class RscTewardTypeMessage: X3_RscText
        {
            idc = 300;
            text = "";
            x = 0.0050503;
            y = 0.14478;
            w = 0.990152;
            h = 0.0478114;
            style = ST_CENTER;
        };
    };
};