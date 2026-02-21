// $[1.03,[[0,0,1,1],0.01,0.01],[1200,"",[0,"ca\ui\data\ui_background_controls_ca.paa",[0.275726,0.195238,0.577274,0.611018],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],""],[]],[1201,"",[0,"ca\ui\data\ui_background_video_buttons_ca",[0.271464,0.369805,0.572387,0.099953],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],""],[]],[1500,"",[0,"",[0.276199,0.418074,0.230839,0.304329],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],""],[]],[1003,"",[0,"Discipline",[0.28125,0.367,0.196414,0.0549783],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],""],[]],[1702,"",[0,"Accept",[0.51,0.64,0.21616,0.113468],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],""],[]],[1800,"",[0,"Rewards",[0.51,0.549805,0.213637,0.112122],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],""],[]],[1100,"",[0,"Equip a backpack from the heap",[0.515,0.455,0.203535,0.0896116],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],""],[]],[1203,"",[0,"ca\ui\data\cmdbar_player_ca",[0.52,0.58,0.09,0.115],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],""],[]],[1801,"",[0,"Objective",[0.51,0.415,0.213637,0.247187],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],""],[]],[1202,"",[0,"ca\ui\data\cmdbar_player_ca",[0.59,0.58,0.09,0.115],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],""],[]],[1204,"",[0,"ca\ui\data\cmdbar_player_ca",[0.66,0.58,0.09,0.115],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],""],[]],[1207,"",[0,"\CA\misc\data\icons\picture_money_CA",[0.525,0.585,0.0425756,0.0571213],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],""],[]],[1206,"",[0,"\CA\misc\data\icons\picture_money_CA",[0.595,0.585,0.0425756,0.0571213],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],""],[]],[1208,"",[0,"\CA\misc\data\icons\picture_money_CA",[0.665,0.585,0.0425756,0.0571213],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],""],[]],[1001,"",[0,"222",[0.53,0.615,0.0412626,0.0315368],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],""],[]],[1000,"",[0,"222",[0.6,0.615,0.0412626,0.0315368],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],""],[]],[1002,"",[0,"222",[0.67,0.615,0.0412626,0.0315368],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],""],[]],[1205,"",[0,"ca\ui\data\cmdbar_background_ca",[0.54,0.615,0.052475,0.0498051],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],""],[]],[1209,"",[0,"ca\ui\data\cmdbar_background_ca",[0.61,0.615,0.052475,0.0498051],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],""],[]],[1210,"",[0,"ca\ui\data\cmdbar_background_ca",[0.68,0.615,0.052475,0.0498051],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],""],[]],[1211,"",[0,"ca\ui\data\cmdbar_background_ca",[0.52,0.58,0.0886365,0.115584],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],""],[]],[1212,"",[0,"ca\ui\data\cmdbar_background_ca",[0.59,0.58,0.0886365,0.115584],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],""],[]],[1213,"",[0,"ca\ui\data\cmdbar_background_ca",[0.66,0.58,0.0886365,0.115584],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],""],[]]]
class AccoladeDisciplineAreaBackgroundStructuredText: BBRscStructuredText
{
    idc = 1000;
    x = 0.506313;
    y = 0.416884;
    w = 0.218687;
    h = 0.30433;
    colorBackground[] = {0.247,0.2,0.137,1};
};
class AccoladeDisciplineTaskListbox: RscListBox
{
    idc = 1100;
    x = 0.276199;
    y = 0.418074;
    w = 0.230839;
    h = 0.304329;
    sizeEx = 0.027;
    rowHeight = 0.0609;
    borderSize = 1;
    onLBSelChanged = "[_this select 1] call d_fnc_accolade_switch";
};
class AccoladeDisciplineSectionRewardFrame: RscFrame
{
    idc = 1101;
    text = "Reward";
    x = 0.51;
    y = 0.549805;
    w = 0.213637;
    h = 0.112122;
    colorText[] = {0.639,0.576,0.427,1};
};
class AccoladeDisciplineObjectiveStructuredText: BBRscStructuredText
{
    idc = 1200;
    x = 0.515;
    y = 0.455;
    w = 0.203535;
    h = 0.0896116;
    size = 0.025;
    colorBackground[] = {0.247,0.2,0.137,1};
    class Attributes {
        font = "Zeppelin32";
        color = "#ded7a9";
        align = "left";
        valign = "middle";
        shadow = 1;
    };
};
class AccoladeDisciplineSectionDescriptionFrame: RscFrame
{
    idc = 1102;
    text = "Description";
    x = 0.51;
    y = 0.415;
    w = 0.213637;
    h = 0.247187;
    colorText[] = {0.639,0.576,0.427,1};
};
class AccoladeDisciplineReward1OutlinePicture: XD_RscPicture
{
    idc = 1300;
    x = 0.52;
    y = 0.58;
    w = 0.09;
    h = 0.115;
};
class AccoladeDisciplineReward2OutlinePicture: XD_RscPicture
{
    idc = 1301;
    x = 0.59;
    y = 0.58;
    w = 0.09;
    h = 0.115;
};
class AccoladeDisciplineReward3OutlinePicture: XD_RscPicture
{
    idc = 1302;
    x = 0.66;
    y = 0.58;
    w = 0.09;
    h = 0.115;
};
class AccoladeDisciplineReward1OutlineBackgroundPicture: XD_RscPicture
{
    idc = 1310;
    text = "ca\ui\data\cmdbar_background_ca";
    x = 0.52;
    y = 0.58;
    w = 0.0886365;
    h = 0.115584;
    colorText[] = {0.1, 0.1, 0.1, 0.5};
};
class AccoladeDisciplineReward2OutlineBackgroundPicture: XD_RscPicture
{
    idc = 1311;
    text = "ca\ui\data\cmdbar_background_ca";
    x = 0.59;
    y = 0.58;
    w = 0.0886365;
    h = 0.115584;
    colorText[] = {0.1, 0.1, 0.1, 0.5};
};
class AccoladeDisciplineReward3OutlineBackgroundPicture: XD_RscPicture
{
    idc = 1312;
    text = "ca\ui\data\cmdbar_background_ca";
    x = 0.66;
    y = 0.58;
    w = 0.0886365;
    h = 0.115584;
    colorText[] = {0.1, 0.1, 0.1, 0.5};
};
class AccoladeDisciplineReward1ItemPicture: XD_RscPicture
{
    idc = 1400;
    x = 0.525;
    y = 0.585;
    w = 0.0425756;
    h = 0.0571213;
    style = ST_MULTI + ST_TITLE_BAR + ST_KEEP_ASPECT_RATIO;
};
class AccoladeDisciplineReward2ItemPicture: XD_RscPicture
{
    idc = 1401;
    x = 0.595;
    y = 0.585;
    w = 0.0425756;
    h = 0.0571213;
    style = ST_MULTI + ST_TITLE_BAR + ST_KEEP_ASPECT_RATIO;
};
class AccoladeDisciplineReward3ItemPicture: XD_RscPicture
{
    idc = 1402;
    x = 0.665;
    y = 0.585;
    w = 0.0425756;
    h = 0.0571213;
    style = ST_MULTI + ST_TITLE_BAR + ST_KEEP_ASPECT_RATIO;
};
class AccoladeDisciplineReward1TextBackgroundPicture: XD_RscPicture
{
    idc = 1500;
    x = 0.54;
    y = 0.615;
    w = 0.052475;
    h = 0.0498051;
};
class AccoladeDisciplineReward2TextBackgroundPicture: XD_RscPicture
{
    idc = 1501;
    x = 0.61;
    y = 0.615;
    w = 0.052475;
    h = 0.0498051;
};
class AccoladeDisciplineReward3TextBackgroundPicture: XD_RscPicture
{
    idc = 1502;
    x = 0.68;
    y = 0.615;
    w = 0.052475;
    h = 0.0498051;
};
class AccoladeDisciplineReward1AmountText: X3_RscText
{
    idc = 1600;
    x = 0.53;
    y = 0.615;
    w = 0.0412626;
    h = 0.0315368;
    colorText[] = {0.871,0.843,0.663,1};
    sizeEx = 0.027;
    style = ST_CENTER;
};
class AccoladeDisciplineReward2AmountText: X3_RscText
{
    idc = 1601;
    x = 0.6;
    y = 0.615;
    w = 0.0412626;
    h = 0.0315368;
    colorText[] = {0.871,0.843,0.663,1};
    sizeEx = 0.027;
    style = ST_CENTER;
};
class AccoladeDisciplineReward3AmountText: X3_RscText
{
    idc = 1602;
    x = 0.67;
    y = 0.615;
    w = 0.0412626;
    h = 0.0315368;
    colorText[] = {0.871,0.843,0.663,1};
    sizeEx = 0.027;
    style = ST_CENTER;
};
class AccoladeDisciplineActionButton: XD_ButtonBase
{
    idc = 1800;
    x = 0.51;
    y = 0.64;
    w = 0.21616;
    h = 0.113468;
    action = "[((uiNamespace getVariable ""X_ACCOLADE_DIALOG"") displayCtrl 1100) lbData (lbCurSel 1100)] call d_fnc_accolade_action";
};