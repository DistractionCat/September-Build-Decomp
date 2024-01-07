switch state
{
    case states.normal:
        var dir = point_direction(x, y, obj_player1.x, obj_player1.y)
        x = lerp(x, (obj_player1.x - (100 * obj_player1.xscale)), 0.05)
        y = lerp(y, (obj_player1.y - 100), 0.05)
        if (x != obj_player1.x)
            image_xscale = (-(sign((x - obj_player1.x))))
        break;
    case states.transitioncutscene:
        if ((!instance_exists(trapid)) || (distance_to_object(obj_player1) > trapid.player_distance_threshold && trapid.object_index != obj_tvtrap))
            state = states.normal
        if instance_exists(trapid)
        {
            var xto = (trapid.x + trapid.xoffset)
            var yto = (trapid.y + trapid.yoffset)
            dir = point_direction(x, y, xto, yto)
            x = Approach(x, xto, abs(lengthdir_x(32, dir)))
            y = Approach(y, yto, abs(lengthdir_y(32, dir)))
            if (x == xto && y == yto)
                state = (141 << 0)
        }
        break;
    case (141 << 0):
        if ((!instance_exists(trapid)) || (distance_to_object(obj_player1) > trapid.player_distance_threshold && trapid.object_index != obj_tvtrap))
            state = states.normal
        with (trapid)
        {
            switch object_index
            {
                case obj_anchortrap:
                    if (state != (135 << 0) && state != states.jump && obj_player1.x > (x - 100) && obj_player1.x < (x + 100) && obj_player1.y > y && obj_player1.y < (y + 500))
                    {
                        state = (135 << 0)
                        vsp = 10
                    }
                    break;
                case obj_knighttrap:
                    if (cooldown == 0 && state != states.punch && obj_player1.x > (x - 200) && obj_player1.x < (x + 200) && obj_player1.y > (y - 100) && obj_player1.y < (y + 100))
                    {
                        state = states.punch
                        sprite_index = spr_knightpep_attack
                        image_index = 0
                        cooldown = 50
                    }
                    break;
            }

        }
        break;
}

visible = state != (141 << 0)
