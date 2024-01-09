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