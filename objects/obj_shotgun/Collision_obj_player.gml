with (other)
{
    if (state == states.handstandjump || state == states.lungeattack)
    {
        image_index = 0
        sprite_index = spr_shotgunpullout
        scr_soundeffect(sfx_shotgungot)
        instance_destroy(other)
        shotgunAnim = 1
        tv_push_prompt_once(tv_create_prompt("This is the shotgun powerup text", (2 << 0), 373, 3), "shotgun")
        global.heattime = 60
        instance_create(x, y, obj_shotgunback)
    }
}
