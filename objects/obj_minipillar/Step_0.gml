if (room == rm_editor)
{
    mask_index = spr_minipillarwoke
    return;
}
if ((global.panic == 0 || global.gerome == 1) && global.treasure == 0)
{
    x = -100
    y = -100
    sprite_index = spr_minipillarsleep
    mask_index = spr_minipillarsleep
}
else
{
    mask_index = spr_minipillarwoke
    sprite_index = spr_minipillarwoke
    x = xstart
    y = ystart
}