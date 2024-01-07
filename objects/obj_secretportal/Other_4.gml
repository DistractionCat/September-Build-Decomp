with (obj_player)
{
    if (object_index != obj_player2 || global.coop)
    {
        if (targetDoor == "S" && secretportalID == other.id)
        {
            x = other.x
            y = other.y
            other.sprite_index = spr_pizzaportal_disappear
            other.image_index = 0
        }
    }
}
if (ds_list_find_index(global.saveroom, id) != -1)
{
    active = 0
    sprite_index = spr_pizzaportal_disappear
    image_index = 0
}
