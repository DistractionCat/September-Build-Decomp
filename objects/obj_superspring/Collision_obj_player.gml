with (other)
{
    if (state != states.Sjump && state != states.gotoplayer)
    {
        if (state == states.knightpep || state == states.knightpepattack || state == states.knightpepslopes)
        {
            with (instance_create(x, y, obj_knightdebris))
                image_index = 0
            with (instance_create(x, y, obj_knightdebris))
                image_index = 1
            with (instance_create(x, y, obj_knightdebris))
                image_index = 2
            with (instance_create(x, y, obj_knightdebris))
                image_index = 3
            with (instance_create(x, y, obj_knightdebris))
                image_index = 4
            with (instance_create(x, y, obj_knightdebris))
                image_index = 5
        }
        if (state == states.bombpep)
            instance_create(x, y, obj_bombexplosion)
        x = other.x
        instance_create(x, (y - 20), obj_bangeffect)
        sprite_index = spr_superspringplayer
        state = states.Sjump
        vsp = -10
        other.image_index = 0
        other.sprite_index = spr_presentbox_activate
    }
}