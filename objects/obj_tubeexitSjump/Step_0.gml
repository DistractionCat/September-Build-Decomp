if (state == states.tube)
{
    if (image_index > (image_number - 1))
    {
        with (playerid)
        {
            sprite_index = spr_superspringplayer
            state = states.Sjump
            vsp = -10
            if place_meeting(x, y, obj_solid)
            {
                while place_meeting(x, y, obj_solid)
                    y--
            }
            if (!(place_meeting(x, y, other.id)))
            {
                instance_create(x, y, obj_bangeffect)
                with (other)
                {
                    state = states.normal
                    playerid = -1
                }
            }
        }
    }
}
