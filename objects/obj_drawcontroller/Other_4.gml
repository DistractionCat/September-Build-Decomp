if (room != kidsparty_entrance1)
{
    var roomname = room_get_name(room)
    roomname = string_letters(roomname)
    if (roomname == "kidsparty" || roomname == "kidspartyentrance" || room == factory_8 || room == factory_9 || room == factory_12)
    {
        use_lighting = 1
        bg_alpha = 0.8
        circle_alpha_out = 0.4
        circle_alpha_in = 1
        circle_size_out = 178
        circle_size_in = 128
    }
    else
        use_lighting = 0
}
else
    use_lighting = 0
