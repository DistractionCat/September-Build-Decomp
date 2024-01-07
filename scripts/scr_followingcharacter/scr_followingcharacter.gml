function following_character_delete() //following_character_delete
{
    var p = ds_list_find_index(global.followerlist, id)
    if (p != -1)
    {
        ds_list_delete(global.followerlist, p)
        var _id = id
        with (obj_followcharacter)
        {
            if (id != _id)
            {
                pos = ds_list_find_index(global.followerlist, id)
                followid = (pos > 0 ? ds_list_find_value(global.followerlist, (pos - 1)) : -4)
            }
        }
    }
}

function following_character_calculate() //following_character_calculate
{
    with (obj_followcharacter)
    {
        pos = ds_list_find_index(global.followerlist, id)
        followid = (pos > 0 ? ds_list_find_value(global.followerlist, (pos - 1)) : -4)
    }
}

function following_add_to_front() //following_add_to_front
{
    if (ds_list_find_index(global.followerlist, id) != -1)
        ds_list_delete(global.followerlist, ds_list_find_index(global.followerlist, id))
    ds_list_insert(global.followerlist, 0, id)
    pos = ds_list_find_index(global.followerlist, id)
    followid = (pos > 0 ? ds_list_find_value(global.followerlist, (pos - 1)) : -4)
    following_character_calculate()
}

function farmer_rearrange() //farmer_rearrange
{
    with (obj_farmer1follow)
    {
        if (farmerpos == obj_player1.farmerpos)
            following_add_to_front()
    }
}

function following_has_follower(argument0) //following_has_follower
{
    for (var i = 0; i < ds_list_size(global.followerlist); i++)
    {
        var b = ds_list_find_value(global.followerlist, i)
        if (instance_exists(b) && b.object_index == argument0)
            return 1;
    }
    return 0;
}

function following_count(argument0) //following_count
{
    var n = 0
    for (var i = 0; i < ds_list_size(global.followerlist); i++)
    {
        var b = ds_list_find_value(global.followerlist, i)
        if (instance_exists(b) && b.object_index == argument0)
            n++
    }
    return n;
}

