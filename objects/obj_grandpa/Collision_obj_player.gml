with (obj_player)
{
    if (state == states.knightpep || state == states.knightpepslopes)
        instance_destroy(other)
}
sprite_index = spr_grandpa_punch
image_index = 0
scr_hurtplayer(other)
