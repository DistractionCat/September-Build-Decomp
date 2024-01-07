if instance_exists(other)
{
	if (other.state != states.hit && other.thrown == 1 && other.state != states.hit && other.killbyenemy && other != other.id && other.state != states.grabbed && (!other.invincible) && other.instantkillable && ((global.attackstyle != 2 && (!global.kungfu)) || other.hp <= 0) && (!global.kungfu))
	{
	    scr_soundeffect(sfx_punch)
	    if (other.object_index != obj_tank || other.hp <= 0)
	        other.hp -= 99
	    if (!other.important)
	    {
	        global.style += (5 + global.combo)
	        global.combo += 1
	        global.combotime = 60
	        global.heattime = 60
	    }
	    with (obj_player1)
	    {
	        if (supercharge < 10)
	            supercharge += 1
	    }
	    var lag = 5
	    if (other.object_index != obj_tank || other.hp <= 0)
	    {
	        other.hitLag = lag
	        other.hitX = other.x
	        other.hitY = other.y
	        if (other.object_index != obj_tank || other.hp <= 0)
	            other.hp -= 1
	        instance_create(other.x, other.y, obj_parryeffect)
	        other.alarm[3] = 3
	        other.state = states.hit
	        other.image_xscale = other.image_xscale
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
	        other.hitvsp = -8
	        other.hithsp = ((-other.image_xscale) * 15)
	        if other.destroyable
	            instance_destroy(other)
	    }
	    if (other.object_index != obj_tank || other.hp <= 0)
	        instance_destroy(other)
	}
}
/*if instance_exists(baddieID)
{
	if (baddieID.state != states.hit && other.baddieID.thrown == 1 && other.baddieID.state != states.hit && baddieID.killbyenemy && baddieID != other.id && baddieID.state != states.grabbed && (!baddieID.invincible) && baddieID.instantkillable && ((global.attackstyle != 2 && (!global.kungfu)) || baddieID.hp <= 0) && (!global.kungfu))
	{
	    scr_soundeffect(sfx_punch)
	    if (baddieID.object_index != obj_tank || baddieID.hp <= 0)
	        baddieID.hp -= 99
	    if (!baddieID.important)
	    {
	        global.style += (5 + global.combo)
	        global.combo += 1
	        global.combotime = 60
	        global.heattime = 60
	    }
	    with (obj_player1)
	    {
	        if (supercharge < 10)
	            supercharge += 1
	    }
	    var lag = 5
	    if (baddieID.object_index != obj_tank || baddieID.hp <= 0)
	    {
	        baddieID.hitLag = lag
	        baddieID.hitX = baddieID.x
	        baddieID.hitY = baddieID.y
	        if (baddieID.object_index != obj_tank || baddieID.hp <= 0)
	            baddieID.hp -= 1
	        instance_create(baddieID.x, baddieID.y, obj_parryeffect)
	        baddieID.alarm[3] = 3
	        baddieID.state = states.hit
	        baddieID.image_xscale = other.baddieID.image_xscale
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
	        baddieID.hitvsp = -8
	        baddieID.hithsp = ((-other.baddieID.image_xscale) * 15)
	        if baddieID.destroyable
	            instance_destroy(baddieID)
	    }
	    if (other.baddieID.object_index != obj_tank || other.baddieID.hp <= 0)
	        instance_destroy(other.baddieID)
	}
}
else baddieID = other