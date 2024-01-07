if (cooldown == 0 && (escape == 0 || global.panic == 1))
{
    with (instance_create((x + (image_xscale * 15)), (y - 20), obj_canongoblinbomb))
    {
        other.ID = id
        image_xscale = other.image_xscale
    }
    cooldown = 100
    sprite_index = spr_canonbot_shoot
    image_index = 0
}
if (cooldown > 0)
    cooldown--
if (floor(image_index) == (image_number - 1) && sprite_index == spr_canonbot_shoot)
    sprite_index = spr_canonbot
