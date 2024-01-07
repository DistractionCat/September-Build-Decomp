if (state == states.grabbed)
    scr_enemy_grabbed()
else if (state == states.lungeattack)
    scr_enemy_lungeattack()
scr_squash()
if thrown
{
    scr_destroy_destructibles(hsp, 0)
    scr_destroy_destructibles(0, vsp)
    scr_destroy_destructibles(hsp, vsp)
}
if (state != states.grabbed && state != states.pummel && object_index != obj_pepbat && object_index != obj_fakesanta)
    scr_collision()
if (invtime > 0)
    invtime--
if (sprite_index == walkspr && hsp != 0 && floor(image_index) == (image_number - 1))
    create_particle((x - (image_xscale * 20)), (y + 43), (1 << 0), 0)
if (state == states.walk)
    image_speed = (0.35 + (global.baddiespeed * 0.05))
else if (state != (128 << 0))
    image_speed = 0.35
if (dodgebuffer > 0)
    dodgebuffer--
with (instance_nearest(x, y, obj_player))
{
    if (state == states.backbreaker)
    {
        other.stunned = 0
        if (other.state != states.Throw && (!other.provoked) && other.bombreset > 0)
        {
            other.bombreset = 0
            other.provoked = 1
        }
        other.scaredbuffer = 0
    }
    else if (other.state != states.Throw)
        other.provoked = 0
}
