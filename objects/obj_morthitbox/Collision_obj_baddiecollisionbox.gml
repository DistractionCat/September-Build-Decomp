if ((!other.baddieID.invincible) && other.baddieID.destroyable && playerid.state != states.chainsaw && other.baddieID.state != states.hit && (!other.baddieID.thrown))
{
    var _lag = 5
    other.baddieID.hp -= 6
    other.baddieID.state = states.hit
    other.baddieID.hitX = other.baddieID.x
    other.baddieID.hitY = other.baddieID.y
    other.baddieID.hitLag = _lag
    Mort_DownMovement()
}
