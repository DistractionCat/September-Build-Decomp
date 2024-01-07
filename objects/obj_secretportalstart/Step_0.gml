image_speed = 0.35
switch sprite_index
{
    case spr_pizzaportalentrancestart:
        with (obj_player)
        {
            if (object_index != obj_player2 || global.coop)
            {
                x = other.x
                y = other.y
                roomstartx = x
                roomstarty = y
                visible = false
            }
        }
        if (floor(image_index) == (image_number - 1))
        {
            sprite_index = spr_pizzaportal_disappear
            with (obj_player)
            {
                if (object_index != obj_player2 || global.coop)
                    visible = true
            }
        }
        break;
    case spr_pizzaportal_disappear:
        if (floor(image_index) == (image_number - 1))
            image_index = (image_number - 1)
        break;
}

