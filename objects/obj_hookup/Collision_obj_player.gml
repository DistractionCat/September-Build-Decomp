with (other)
{
    if (key_up && ladderbuffer == 0 && (state == states.fireass || state == states.normal || state == states.pogo || state == states.mach2 || state == states.mach3 || state == states.mach1 || state == states.shotgunjump || state == states.highjump) && state != states.hurt && state != states.machslide && state != states.freefall && state != states.freefallland)
    {
        other.hooked = 1
        mach2 = 0
        state = states.ladder
        x = (other.x + 16)
        y = floor(y)
        if ((y % 2) == 1)
            y--
        if (y > (other.y + 90))
            y -= 5
    }
}
