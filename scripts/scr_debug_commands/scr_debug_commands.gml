function string_split(argument0, argument1) //string_split
{
    argument0 += " "
    var _current_str = ""
    var _list = [0]
    for (var i = 1; i < (string_length(argument0) + 1); i++)
    {
        var _char = string_char_at(argument0, i)
        if (_char != argument1)
            _current_str += _char
        else
        {
            array_push(_list, _current_str)
            _current_str = ""
        }
    }
    return _list;
}

function function_overload(arg_array, func)
{
	var _size = array_length(arg_array);
	switch (_size - 1)
	{
		case -1:
			func();
			break;
		case 0:
			func(arg_array[0]);
			break;
		case 1:
			func(arg_array[0], arg_array[1]);
			break;
		case 2:
			func(arg_array[0], arg_array[1], arg_array[2]);
			break;
		case 3:
			func(arg_array[0], arg_array[1], arg_array[2], arg_array[3]);
			break;
		case 4:
			func(arg_array[0], arg_array[1], arg_array[2], arg_array[3], arg_array[4]);
			break;
		case 5:
			func(arg_array[0], arg_array[1], arg_array[2], arg_array[3], arg_array[4], arg_array[5]);
			break;
		case 6:
			func(arg_array[0], arg_array[1], arg_array[2], arg_array[3], arg_array[4], arg_array[5], arg_array[6]);
			break;
	}
}

function DebugCommand(argument0, argument1, argument2, argument3) constructor //DebugCommand
{
    command_id = argument0
    description = argument1
    format = argument2
    func = argument3
    Invoke = function(argument0) //anon_DebugCommand_gml_GlobalScript_scr_debug_commands_1117_DebugCommand_gml_GlobalScript_scr_debug_commands
    {
        if (argument0 != undefined)
            function_overload(argument0, func)
        else
            func()
    }

}

function TextList_Add(argument0, argument1) //TextList_Add
{
    with (obj_debugcontroller)
    {
        if DEBUG
            ds_list_add(text_list, [argument0, argument1])
    }
}

