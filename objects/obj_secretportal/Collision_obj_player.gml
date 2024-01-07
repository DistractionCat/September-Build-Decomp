if (active && sprite_index != spr_pizzaportal_appear && ds_list_find_index(global.saveroom, id) == -1)
{
    if (sprite_index != spr_pizzaportalend)
    {
        sprite_index = spr_pizzaportalend
        image_index = 0
    }
    other.x = x
    other.y = y
    other.vsp = 0
    other.hsp = 0
    other.visible = false
}
