function tv_set_idle() //tv_set_idle
{
    with (obj_tv)
    {
        state = states.normal
        sprite_index = spr_tv_idle
    }
}

function tv_reset() //tv_reset
{
    with (obj_tv)
    {
        state = states.normal
        sprite_index = spr_tv_idle
        ds_list_clear(tvprompts_list)
    }
}

function tv_create_prompt(argument0, argument1, argument2, argument3) //tv_create_prompt
{
    return [argument0, argument1, argument2, argument3];
}

function tv_push_prompt(argument0, argument1, argument2, argument3) //tv_push_prompt
{
    with (obj_tv)
    {
        var b = [argument0, argument1, argument2, argument3]
        var play = 0
        switch argument1
        {
            case (0 << 0):
                play = 1
                ds_list_insert(tvprompts_list, 0, b)
                break;
            case (1 << 0):
                var placed = 0
                var i = 0
                while (i < ds_list_size(tvprompts_list))
                {
                    var b2 = ds_list_find_value(tvprompts_list, i)
                    if (b2[1] == (2 << 0))
                    {
                        if (i == 0)
                            play = 1
                        ds_list_insert(tvprompts_list, i, b)
                        placed = 1
                        break;
                    }
                    else
                    {
                        i++
                        continue
                    }
                }
                if (!placed)
                    ds_list_add(tvprompts_list, b)
                break;
            case (2 << 0):
                ds_list_add(tvprompts_list, b)
                break;
        }

        if play
            state = states.normal
    }
}

function tv_push_prompt_array(argument0) //tv_push_prompt_array
{
    for (var i = 0; i < array_length(argument0); i++)
    {
        with (obj_tv)
        {
            var b = argument0[i]
            tv_push_prompt(b[0], b[1], b[2], b[3])
        }
    }
}

function tv_push_prompt_once(argument0, argument1) //tv_push_prompt_once
{
    with (obj_tv)
    {
        if (special_prompts == -4)
            return 0;
        var b = ds_map_find_value(special_prompts, argument1)
        if is_undefined(b)
            return 0;
        if (b != 1)
        {
            tv_push_prompt(argument0[0], argument0[1], argument0[2], argument0[3])
            ds_map_set(special_prompts, argument1, 1)
            ini_open_from_string(obj_savesystem.ini_str)
            ini_write_real("Prompts", argument1, 1)
            obj_savesystem.ini_str = ini_close()
            return 1;
        }
        return 0;
    }
}

function tv_default_condition() //tv_default_condition
{
    return place_meeting(x, y, obj_player);
}

