if (inv_timer > 0)
    inv_timer--
else if (inv_timer == 0)
{
    inv_timer = -1
    invincible = 0
}
if colliding
    scr_collide()
else
{
    x += hsp
    y += vsp
    trace(colliding, ", Hsp: ", hsp, "Vsp: ", vsp)
}
