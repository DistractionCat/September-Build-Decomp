function scr_enemy_hit() //scr_enemy_hit
{
    x = (hitX + random_range(-6, 6))
    y = (hitY + random_range(-6, 6))
    hitLag--
    sprite_index = stunfallspr
    if (hitLag <= 0)
    {
        x = hitX
        y = hitY
        state = states.stun
        vsp = hitvsp
        hsp = hithsp
        global.hit += 1
        if (other.object_index == obj_pizzaball)
            global.golfhit += 1
        global.combotime = 60
        global.heattime = 60
        alarm[1] = 5
        stunned = 200
        state = states.stun
        var _hp = 0
        if ((global.attackstyle == 3 || global.attackstyle == 0) && (!global.kungfu))
            _hp = -1
        if ((hp <= _hp || mach3destroy) && object_get_parent(object_index) != 12 && destroyable)
        {
            instance_destroy()
            instance_create(x, y, obj_genericpoofeffect)
        }
    }
}

