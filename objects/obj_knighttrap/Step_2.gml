switch state
{
    case states.punch:
        if (floor(image_index) == (image_number - 1))
        {
            state = states.normal
            sprite_index = spr_knight
        }
        break;
}

if (cooldown > 0 && state != states.punch)
    cooldown--
