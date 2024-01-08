function scr_player_mach2() //scr_player_mach2
{
    if (windingAnim < 2000)
        windingAnim++
    if (!(place_meeting(x, (y + 1), obj_railparent)))
        hsp = (xscale * movespeed)
    else
    {
        var _railinst = instance_place(x, (y + 1), obj_railparent)
        hsp = ((xscale * movespeed) + (_railinst.movespeed * _railinst.dir))
    }
    move2 = (key_right2 + key_left2)
    move = (key_right + key_left)
    crouchslideAnim = 1
    if ((!key_jump2) && jumpstop == 0 && vsp < 0.5)
    {
        vsp /= 20
        jumpstop = 1
    }
    if (grounded && vsp > 0)
        jumpstop = 0
    if (input_buffer_jump < 8 && grounded && sprite_index != spr_secondjump1 && sprite_index != spr_clownjump && (!((move == 1 && xscale == -1))) && (!((move == -1 && xscale == 1))))
    {
        image_index = 0
        sprite_index = spr_secondjump1
        scr_soundeffect(sfx_jump)
        if skateboarding
            sprite_index = spr_clownjump
        vsp = -11
    }
    var mortjump = 0
    if (key_jump && global.mort == 1 && sprite_index != spr_mortdoublejump && (!grounded) && (!skateboarding))
    {
        state = states.jump
        repeat (6)
            create_debris(x, y, spr_feather)
        scr_soundeffect(sfx_woosh)
        sprite_index = spr_mortdoublejump
        image_index = 0
        grav = 0.25
        with (instance_create(x, y, obj_highjumpcloud2))
            image_xscale = other.xscale
        mort = 1
        mortjump = 1
    }
    if (grounded && vsp > 0)
    {
        if (machpunchAnim == 0 && sprite_index != spr_mach && sprite_index != spr_mach4 && sprite_index != spr_player_machhit)
        {
            if (sprite_index != spr_player_machhit && sprite_index != spr_rollgetup && sprite_index != spr_taunt && sprite_index != spr_player_Sjumpcancelstart)
                sprite_index = spr_mach
        }
        if (machpunchAnim == 1)
        {
            if (punch == 0)
                sprite_index = spr_machpunch1
            if (punch == 1)
                sprite_index = spr_machpunch2
            if (floor(image_index) == 4 && sprite_index == spr_machpunch1)
            {
                punch = 1
                machpunchAnim = 0
            }
            if (floor(image_index) == 4 && sprite_index == spr_machpunch2)
            {
                punch = 0
                machpunchAnim = 0
            }
        }
    }
    if (!grounded)
        machpunchAnim = 0
    if grounded
    {
        if (movespeed < 12)
        {
            if (scr_slope() && hsp != 0 && movespeed > 8)
                scr_player_addslopemomentum(0.2, 0.4)
            movespeed += 0.1
        }
        if (movespeed >= 12 && skateboarding == 0)
        {
            machhitAnim = 0
            state = states.mach3
            flash = 1
            if (sprite_index != spr_rollgetup)
                sprite_index = spr_mach4
            particle_set_scale((5 << 0), xscale, 1)
            create_particle(x, y, (5 << 0), 0)
        }
    }
    if key_jump
        input_buffer_jump = 0
    if (grounded && (place_meeting((x + sign(hsp)), (y - 16), obj_solid) || scr_solid_slope((x + sign(hsp)), (y - 16))) && (!(place_meeting((x + hsp), y, obj_destructibles))) && (!(place_meeting((x + hsp), y, obj_metalblock))) && place_meeting(x, (y + 1), obj_slope))
    {
        wallspeed = movespeed
        state = states.climbwall
    }
    if ((!grounded) && place_meeting((x + sign(hsp)), y, obj_climbablewall) && (!(place_meeting((x + sign(hsp)), y, obj_destructibles))) && (!(place_meeting((x + sign(hsp)), y, obj_metalblock))))
    {
        wallspeed = movespeed
        state = states.climbwall
    }
    if ((!instance_exists(dashcloudid)) && grounded)
    {
        with (instance_create(x, y, obj_dashcloud))
        {
            image_xscale = other.xscale
            other.dashcloudid = id
        }
    }
    if (grounded && floor(image_index) == (image_number - 1) && sprite_index == spr_rollgetup)
        sprite_index = spr_mach
    if ((!grounded) && sprite_index != spr_secondjump2 && sprite_index != spr_clownjump && sprite_index != spr_clownfall && sprite_index != spr_mach2jump && sprite_index != spr_mach2jump && sprite_index != spr_walljumpstart && sprite_index != spr_taunt && sprite_index != spr_player_Sjumpcancelstart && sprite_index != spr_walljumpend)
    {
        sprite_index = spr_secondjump1
        if skateboarding
            sprite_index = spr_clownfall
    }
    if (floor(image_index) == (image_number - 1) && sprite_index == spr_secondjump1)
        sprite_index = spr_secondjump2
    if (floor(image_index) == (image_number - 1) && sprite_index == spr_walljumpstart)
        sprite_index = spr_walljumpend
    if ((!grounded) && sprite_index != spr_clownfall && sprite_index == spr_clownjump && floor(image_index) == (image_number - 1))
        sprite_index = spr_clownfall
    if (key_down && (!(place_meeting(x, y, obj_dashpad))))
    {
        particle_set_scale((5 << 0), xscale, 1)
        create_particle(x, y, (5 << 0), 0)
        flash = 0
        state = states.tumble
        vsp = 10
        if (!grounded)
            sprite_index = spr_player_mach2jump
        else
            sprite_index = spr_player_machroll
        if (character == "V")
            sprite_index = spr_playerV_divekickstart
    }
    if (key_attack && (!(place_meeting((x + xscale), y, obj_solid))) && character == "S" && grounded)
    {
        state = states.handstandjump
        movespeed = 0
    }
	if ((!grounded && (place_meeting(x + hsp, y, obj_solid) || scr_solid_slope(x + hsp, y)) && !place_meeting(x + hsp, y, obj_destructibles) && !place_meeting(x + hsp, y, obj_mach3solid) && !place_meeting(x + hsp, y, obj_metalblock)) || (grounded && (place_meeting(x + sign(hsp), y - 16, obj_solid) || scr_solid_slope(x + sign(hsp), y - 16)) && !place_meeting(x + hsp, y, obj_destructibles) && !place_meeting(x + hsp, y, obj_mach3solid) && !place_meeting(x + hsp, y, obj_metalblock) && place_meeting(x, y + 1, obj_slope)))
	{
		state = states.climbwall
		movespeed = wallspeed
	}
    if (grounded && (!scr_slope()) && (place_meeting((x + hsp), y, obj_solid) || scr_solid_slope((x + hsp), y)) && ((!(place_meeting((x + hsp), y, obj_destructibles))) || character == "V") && (!(place_meeting((x + hsp), y, obj_climbablewall))))
    {
        if skateboarding
            xscale *= -1
        else
        {
            var _bump = ledge_bump((vsp >= 0 ? 32 : 22))
            if _bump
            {
                state = states.bump
                image_index = 0
                sprite_index = spr_player_wallsplat
            }
        }
    }
    if (((!key_attack) && move != xscale && grounded && skateboarding == 0) || (character == "S" && move == 0 && grounded))
    {
        image_index = 0
        state = states.machslide
        scr_soundeffect(sfx_break)
        sprite_index = spr_machslidestart
    }
    if (move == (-xscale) && grounded && skateboarding == 0)
    {
        scr_soundeffect(sfx_machslideboost)
        image_index = 0
        state = states.machslide
        sprite_index = spr_machslideboost
    }
    if (clowntimer > 0 && skateboarding == 1)
        clowntimer--
    if (clowntimer <= 0 && skateboarding == 1)
    {
        state = states.normal
        instance_create(x, y, obj_genericpoofeffect)
    }
    if (key_slap2 && character == "V")
    {
        vsp = -5
        state = states.revolver
        image_index = 0
        sprite_index = spr_playerV_airrevolver
        image_index = 0
        with (instance_create((x + (xscale * 20)), (y + 20), obj_shotgunbullet))
        {
            is_solid = 0
            image_xscale = other.xscale
        }
        scr_soundeffect(sfx_killingblow)
    }
    if (key_shoot2 && character == "V" && (!instance_exists(dynamite_inst)))
    {
        vsp = -5
        state = states.dynamite
        image_index = 0
        sprite_index = spr_playerV_dynamitethrow
        with (instance_create(x, y, obj_dynamite))
        {
            image_xscale = other.xscale
            other.dynamite_inst = id
            playerid = other.id
            movespeed = (other.movespeed + 4)
            vsp = -6
        }
    }
    if (move == xscale && (!key_attack) && grounded && skateboarding == 0)
        state = states.normal
    if (sprite_index == spr_rollgetup)
        image_speed = 0.4
    else
        image_speed = (abs(movespeed) / 15)
    if (key_taunt2 && (!skateboarding))
    {
        scr_soundeffect(sfx_taunt)
        taunttimer = 20
        tauntstoredmovespeed = movespeed
        tauntstoredsprite = sprite_index
        tauntstoredstate = state
        tauntstoredvsp = vsp
        state = states.backbreaker
        if (supercharged == 1)
        {
            image_index = 0
            sprite_index = choose(spr_supertaunt1, spr_supertaunt2, spr_supertaunt3, spr_supertaunt4)
        }
        else
        {
            taunttimer = 20
            image_index = random_range(0, 11)
            sprite_index = spr_taunt
        }
        with (instance_create(x, y, obj_taunteffect))
            player = other.id
    }
    if (skateboarding && sprite_index != spr_clownjump && grounded)
        sprite_index = spr_clown
    if mortjump
        sprite_index = spr_player_mortjumpstart
    if (global.attackstyle == 2 && key_slap2)
    {
        randomize_animations([spr_suplexmash1, spr_suplexmash2, spr_suplexmash3, spr_suplexmash4, 580, 579, 578, spr_punch])
        image_index = 0
        state = states.lungeattack
    }
}

