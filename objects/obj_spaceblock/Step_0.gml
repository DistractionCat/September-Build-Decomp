if (global.spaceblockswitch == 1)
{
    x = -100
    y = -100
    sprite_index = spr_spaceblock_open
}
else if (global.spaceblockswitch == 0 && (x != xstart || sprite_index != spr_spaceblock_closed) && (!(place_meeting(xstart, ystart, obj_player))) && (!(place_meeting(xstart, ystart, obj_baddie))) && (!(place_meeting(xstart, ystart, obj_clownmato))))
{
    mask_index = spr_spaceblock_closed
    sprite_index = spr_spaceblock_closed
    x = xstart
    y = ystart
}
