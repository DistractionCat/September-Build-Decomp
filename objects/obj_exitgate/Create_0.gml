image_speed = 0
image_index = 1
if (room != rm_editor)
    depth = 50
roomname = room_get_name(room)
global.progress = string_letters(roomname)
if (obj_player.character == "S")
    instance_destroy()
