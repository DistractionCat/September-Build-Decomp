if place_meeting(x, y, obj_player)
{
    with (obj_player)
    {
        if (key_down && (state == states.crouch || (character == "S" && (state == states.normal || state == states.mach1) && place_meeting(x, (y + 1), other) && place_meeting(x, (y + 1), obj_platform))))
        {
            other.hooked = 1
            other.playerid = object_index
            y += 5
            state = states.ladder
            x = (other.x + 16)
            y = floor(y)
            if ((y % 2) == 1)
                y--
            if (y > (other.y + 90))
                y -= 5
        }
    }
}
if hooked
{
    if place_meeting(x, (y - 50), obj_solid)
        instance_destroy()
    if ((!blinking) && place_meeting(x, (y - 200), obj_solid))
    {
        blinking = 1
        alarm[0] = 1
    }
    y -= 5
    with (obj_player)
    {
        if (state == states.ladder && place_meeting(x, y, other))
            y -= 5
    }
    if (y < -50)
        instance_destroy()
}
