if (image_index == 1 && global.panic == 0)
{
    with (obj_player)
    {
        if (state == states.comingoutdoor && floor(image_index) == (image_number - 2))
        {
            scr_soundeffect(sfx_groundpound)
            GamepadSetVibration(0, 1, 1, 0.9)
            GamepadSetVibration(1, 1, 1, 0.9)
            with (obj_player1)
            {
                lastroom = room
                sprite_index = spr_Timesup
                image_index = 0
                with (obj_camera)
                {
                    shake_mag = 10
                    shake_mag_acc = (30 / room_speed)
                }
            }
            if (global.coop == 1)
            {
                with (obj_player2)
                {
                    lastroom = room
                    sprite_index = spr_Timesup
                    image_index = 0
                    with (obj_camera)
                    {
                        shake_mag = 10
                        shake_mag_acc = (30 / room_speed)
                    }
                }
            }
            other.image_index = 0
            ds_list_add(global.saveroom, other.id)
        }
    }
}
with (obj_player)
{
    if (grounded && x > (other.x - 160) && x < (other.x + 160) && key_up && (state == states.normal || state == states.mach1 || state == states.mach2 || state == states.mach3) && (global.panic == 1 || global.snickchallenge == 1))
    {
        if (global.timeattack == 1)
            obj_timeattack.stop = 1
        targetDoor = "none"
        obj_camera.alarm[2] = -1
        var roomname = room_get_name(room)
        var namestring = string_letters(roomname)
        scr_savescore(namestring)
        if (!instance_exists(obj_endlevelfade))
            instance_create(x, y, obj_endlevelfade)
        obj_player1.state = states.door
        obj_player1.sprite_index = obj_player1.spr_lookdoor
        if instance_exists(obj_player2)
        {
            obj_player2.state = states.door
            obj_player2.sprite_index = obj_player2.spr_lookdoor
            if global.coop
                obj_player2.visible = true
        }
        obj_endlevelfade.alarm[0] = 235
        image_index = 0
        global.panic = 0
        global.snickchallenge = 0
    }
}
