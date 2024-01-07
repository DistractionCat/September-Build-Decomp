function scr_room_updated(argument0) //scr_room_updated
{
    with (obj_player)
    {
        hallway = savedhallway
        hallwaydirection = savedhallwaydirection
        vhallwaydirection = savedvhallwaydirection
        verticalhallway = savedverticalhallway
    }
    room_goto_live(argument0)
}

