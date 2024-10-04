class RscMapWithListBackground: XD_RscPicture
{
    text = "ca\ui\data\ui_armory_background_ca";
    x = 0.0156243;
    y = 0.15;
    w = 1.23438;
    h = 0.825;
};
class RscMapWithListTextTitle: X3_RscText
{
    x = 0.0328292;
    y = 0.148153;
    w = 0.2;
    h = 0.1;
    style = ST_LEFT;
};
class RscMapWithListMapControl: XD_RscMapControl
{
    x = 0.0211491;
    y = 0.231735;
    w = 0.710858;
    h = 0.501853;
};
class RscMapWithListListbox: RscListbox
{
    x = 0.732113;
    y = 0.231735;
    w = 0.243676;
    h = 0.500000;
    sizeEx = 0.023;
    rowHeight = 0.05;
    style = CT_NO_BORDER + ST_LEFT;
    borderSize = 1;
};
class RscMapWithListButtonAction: XD_ButtonBase
{
    x = 0.734849;
    y = 0.72744;
    w = 0.237627;
    h = 0.113468;
    text = "No Selection";
};
class RscMapWithListButtonClose: XD_ButtonBase
{
    x = 0.03000;
    y = 0.72744;
    w = 0.167627;
    h = 0.113468;
    text = "Close";
    action = "closeDialog 0";
};