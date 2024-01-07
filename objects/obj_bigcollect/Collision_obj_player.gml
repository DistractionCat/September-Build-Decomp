if (other.state != states.gotoplayer)
{
    if (obj_player1.character == "V")
        global.playerhealth = clamp((global.playerhealth + 10), 0, 100)
    global.heattime = 60
    with (obj_camera)
        healthshaketime = 60
    scr_soundeffect(sfx_collectpizza)
    instance_destroy()
    if (other.object_index == obj_player1)
        global.collect += 100
    else
        global.collectN += 100
    create_collect(x, y, sprite_index)
    with (instance_create((x + 16), y, obj_smallnumber))
        number = string(100)
}
