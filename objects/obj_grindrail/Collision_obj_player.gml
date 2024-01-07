if (place_meeting(x, y, other) && other.state != states.backbreaker && other.state != states.bump && other.y > other.yprevious && other.y < y)
{
    if (!other.isgustavo)
    {
        other.y = (y - 49)
        if (other.movespeed < 10)
            other.movespeed = 10
        other.state = states.grind
    }
    else if (other.state != states.ratmountgrind)
    {
        other.y = (y + 8)
        other.state = states.ratmountgrind
    }
}
