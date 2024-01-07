function cutscene_customer_start(argument0) //cutscene_customer_start
{
    var player = argument0
    var finish = 0
    with (player)
    {
        if (sprite_index == spr_player_throw && image_index > (image_number - 1))
            sprite_index = spr_idle
    }
    if (!instance_exists(obj_pizzacustomer))
    {
        with (player)
        {
            state = states.actor
            movespeed = 0
            hsp = 0
            image_speed = 0.35
            sprite_index = spr_player_throw
            image_index = 0
            var depth_obj = other
            with (instance_create(x, y, obj_pizzacustomer))
            {
                depth = depth_obj.depth
                hsp = 0
                vsp = -8
            }
        }
    }
    if instance_exists(obj_pizzacustomer)
    {
        with (obj_pizzacustomer)
        {
            if grounded
                finish = 1
        }
    }
    if finish
        cutscene_end_action()
}

