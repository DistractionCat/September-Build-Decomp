if (state == states.normal)
{
    state = states.arenaintro
    cutscene_count = 150
    global.kungfu = 1
    global.hp = 8
    x = other.x
    y = (other.y - 35)
    with (obj_arenagate)
    {
        sprite_index = spr_arenagate_close
        image_index = 0
        block_inst = instance_create(x, y, obj_solid)
        with (block_inst)
        {
            sprite_index = spr_arenagate_open
            image_xscale = other.image_xscale
            image_yscale = other.image_yscale
        }
    }
}
