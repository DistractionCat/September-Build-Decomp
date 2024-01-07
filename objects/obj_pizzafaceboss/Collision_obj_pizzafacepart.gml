if (other.thrown && ds_list_find_index(other.hitlist, id) == -1)
{
    ds_list_add(other.hitlist, id)
    hp -= 30
    scr_soundeffect(sfx_killingblow)
    instance_create(x, y, obj_parryeffect)
    instance_create(x, y, obj_slapstar)
    instance_create(x, y, obj_slapstar)
    instance_create(x, y, obj_slapstar)
    instance_create(x, y, obj_baddiegibs)
    instance_create(x, y, obj_baddiegibs)
    instance_create(x, y, obj_baddiegibs)
    with (obj_camera)
    {
        shake_mag = 3
        shake_mag_acc = (3 / room_speed)
    }
}
