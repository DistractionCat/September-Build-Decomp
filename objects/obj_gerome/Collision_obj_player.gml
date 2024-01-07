if (global.panic == 1)
{
    ds_list_add(global.saveroom, id)
    global.gerome = 1
    global.stylelock = 1
    instance_create(x, y, obj_geromefollow)
    instance_destroy()
}
if (global.panic == 0)
{
    if ((!grabbed) && (other.state == states.handstandjump || other.state == states.punch || other.state == states.lungeattack) && unpickable == 0)
    {
        instance_create((x + (obj_player1.xscale * 40)), y, obj_punchdust)
        with (other)
        {
            image_index = 0
            sprite_index = spr_haulingstart
            baddiegrabbedID = other.id
            grabbingenemy = 1
            state = states.grab
        }
        playerid = other.object_index
        grabbed = 1
    }
}
