if (global.spaceblockswitch == 1)
{
    if ((x != xstart || sprite_index != spr_spaceblock_closed) && (!(place_meeting(xstart, ystart, obj_player))) && (!(place_meeting(xstart, ystart, obj_baddie))) && (!(place_meeting(xstart, ystart, obj_clownmato))))
    {
        x = xstart
        y = ystart
        sprite_index = spr_spaceblock_closed
        mask_index = spr_minipillarwoke
    }
}
else
{
    x = -100
    y = -100
    sprite_index = spr_spaceblock_open
}
