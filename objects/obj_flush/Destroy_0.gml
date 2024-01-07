if (ds_list_find_index(global.baddieroom, id) == -1)
{
    ds_list_add(global.baddieroom, id)
    switch type
    {
        case 0:
            global.collect += 50
            with (instance_create(x, y, obj_smallnumber))
                number = "50"
            break;
        case 1:
            with (obj_player)
                scr_hurtplayer(id)
            break;
        case 2:
            var _xmin = obj_hardmode
            var _inst = id
            with (obj_flush)
            {
                if (type == 2 && trigger == other.trigger && x > _xmin)
                {
                    _inst = id
                    _xmin = x
                }
            }
            with (obj_flush)
            {
                if (type == 2 && trigger == other.trigger && ds_list_find_index(global.baddieroom, id) == -1)
                    ds_list_add(global.baddieroom, id)
            }
            with (instance_create(_inst.x, _inst.y, obj_badrat))
            {
                var i = 0
                while scr_solid(x, y)
                {
                    y--
                    if (i > room_height)
                        break;
                    else
                        continue
                }
            }
            break;
    }

}
