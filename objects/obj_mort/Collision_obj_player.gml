if (sprite_index != spr_mortspawn && sprite_index != spr_mortfall)
{
    with (other)
    {
        if (state != states.mort && state != states.mortjump && state != states.mortattack && state != states.morthook && state != states.ridecow)
        {
            repeat (6)
                create_debris(x, y, spr_feather)
            mort = 1
            instance_create_unique(x, y, obj_mortfollow)
            state = states.mort
            tv_push_prompt_once(tv_create_prompt("This is the mort powerup text", (2 << 0), 2506, 3), "mort")
            instance_destroy(other)
        }
    }
}
