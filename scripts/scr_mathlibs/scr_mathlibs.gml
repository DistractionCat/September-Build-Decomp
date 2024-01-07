function Vector2(argument0, argument1) constructor //Vector2
{
    if 1
    {
    }
    else
    {
        static Update = function(argument0, argument1) //anon_Vector2_gml_GlobalScript_scr_mathlibs_209_Vector2_gml_GlobalScript_scr_mathlibs
        {
            x = argument0
            y = argument1
        }

        static UpdateVector = function(argument0) //anon_Vector2_gml_GlobalScript_scr_mathlibs_281_Vector2_gml_GlobalScript_scr_mathlibs
        {
            x = argument0.x
            y = argument0.y
        }

        static Add = function(argument0, argument1) //anon_Vector2_gml_GlobalScript_scr_mathlibs_359_Vector2_gml_GlobalScript_scr_mathlibs
        {
            x += argument0
            y += argument1
        }

        static AddVector = function(argument0) //anon_Vector2_gml_GlobalScript_scr_mathlibs_430_Vector2_gml_GlobalScript_scr_mathlibs
        {
            x += argument0.x
            y += argument0.y
        }

        static Multiply = function(argument0, argument1) //anon_Vector2_gml_GlobalScript_scr_mathlibs_515_Vector2_gml_GlobalScript_scr_mathlibs
        {
            x *= argument0
            y *= argument1
        }

        static Divide = function(argument0, argument1) //anon_Vector2_gml_GlobalScript_scr_mathlibs_583_Vector2_gml_GlobalScript_scr_mathlibs
        {
            x /= argument0
            y /= argument1
        }

        static MultiplyVector = function(argument0) //anon_Vector2_gml_GlobalScript_scr_mathlibs_659_Vector2_gml_GlobalScript_scr_mathlibs
        {
            x *= argument0.x
            y *= argument0.y
        }

        static DivideVector = function(argument0) //anon_Vector2_gml_GlobalScript_scr_mathlibs_748_Vector2_gml_GlobalScript_scr_mathlibs
        {
            x /= argument0.x
            y /= argument0.y
        }

    }
    x = argument0
    y = argument1
}

function cycle(argument0, argument1, argument2) //cycle
{
    var delta = (argument2 - argument1)
    var result = ((argument0 - argument1) % delta)
    if (result < 0)
        result += delta
    return (result + argument1);
}

function angle_rotate(argument0, argument1, argument2) //angle_rotate
{
    var diff = cycle((argument1 - argument0), -180, 180)
    if (diff < (-argument2))
        return (argument0 - argument2);
    if (diff > argument2)
        return (argument0 + argument2);
    return argument1;
}

function get_velocity(argument0, argument1) //get_velocity
{
    return (argument0 / argument1);
}

function Wave(argument0, argument1, argument2, argument3) //Wave
{
    var a4 = ((argument1 - argument0) * 0.5)
    return ((argument0 + a4) + (sin(((((current_time * 0.001) + (argument2 * argument3)) / argument2) * (2 * pi))) * a4));
}

function distance_to_pos(argument0, argument1, argument2, argument3, argument4, argument5) //distance_to_pos
{
    return (abs((argument0 - argument2)) <= argument4 && abs((argument1 - argument3)) <= argument5);
}

function distance_between_points(argument0, argument1, argument2, argument3) //distance_between_points
{
    return sqrt((sqr((argument2 - argument0)) + sqr((argument3 - argument1))));
}

