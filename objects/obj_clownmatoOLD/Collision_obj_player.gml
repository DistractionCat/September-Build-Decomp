if (other.cutscene || other.state == states.firemouth)
    return;
with (other)
{
    vsp = -18
    sprite_index = spr_machfreefall
    jumpstop = 1
    state = states.jump
}
sprite_index = spr_clownmato_bounce
image_index = 0
