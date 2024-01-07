if (visible == true)
{
    if audio_is_playing(sfx_collecttopping)
        audio_stop_sound(sfx_collecttopping)
    scr_soundeffect(sfx_collecttopping)
    visible = false
    repeat (6)
        instance_create(x, y, obj_slimedebris)
    with (other)
        pizzapepper = 200
    timetovisible = 100
}
