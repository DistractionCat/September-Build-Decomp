image_speed = 0.35
if active
{
    if (sprite_index == spr_pizzaportal_disappear)
    {
        sprite_index = spr_pizzaportal_appear
        image_index = 0
    }
}
if (floor(image_index) == (image_number - 1))
{
    switch sprite_index
    {
        case spr_pizzaportal_appear:
            sprite_index = spr_pizzaportal
            break;
        case spr_pizzaportal_disappear:
            image_index = (image_number - 1)
            break;
        case spr_pizzaportalend:
            image_index = (image_number - 1)
            if (!instance_exists(obj_fadeout))
            {
                with (obj_player)
                {
                    targetDoor = "S"
                    lastroom = targetRoom
                    targetRoom = other.targetRoom
                    secretportalID = other.id
                }
                ds_list_add(global.saveroom, id)
                instance_create(x, y, obj_fadeout)
            }
            break;
    }

}
