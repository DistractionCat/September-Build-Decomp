if (other.state != states.gotoplayer && other.state != states.chainsaw)
{
    if (other.state == states.knightpep || other.state == states.knightpepslopes || other.state == states.cheeseball)
    {
        repeat (8)
        {
            with (create_debris(x, y, spr_slimedebris))
            {
                vsp = random_range(-5, 0)
                hsp = random_range(-3, 3)
            }
        }
        instance_destroy()
    }
    else
    {
        tv_push_prompt_once(tv_create_prompt("This is the cheeseball transformation text", (2 << 0), 2194, 3), "cheeseball")
        other.xscale = image_xscale
        other.hsp = hsp
        other.vsp = vsp
        other.x = x
        other.y = y
        other.state = states.cheeseball
        other.stop_buffer = other.stop_max
        repeat (8)
        {
            with (create_debris(x, y, spr_slimedebris))
            {
                vsp = random_range(-5, 0)
                hsp = random_range(-3, 3)
            }
        }
        instance_destroy()
    }
}