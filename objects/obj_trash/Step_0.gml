image_speed = 0.35
if (trashbuffer > 0)
    trashbuffer--
switch state
{
    case states.normal:
        with (obj_player)
        {
            if (other.state == states.normal && state != (208 << 0) && other.trashbuffer <= 0 && place_meeting(x, y, other))
            {
                state = (208 << 0)
                other.playerid = id
                other.state = (208 << 0)
                other.sprite_index = spr_trash_flingstart
                other.image_index = 0
            }
        }
        break;
    case (208 << 0):
        playerid.x = x
        playerid.y = y
        if (floor(image_index) == (image_number - 1))
        {
            sprite_index = spr_trash
            state = states.normal
            trashbuffer = 30
            with (playerid)
            {
                sprite_index = spr_superspringplayer
                state = states.trashjump
                vsp = -25
            }
        }
        break;
}

scr_collision()
