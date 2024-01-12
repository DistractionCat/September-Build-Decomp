function scr_player_mach3() //scr_player_mach3
{
    switch character
    {
        case "P":
            if (windingAnim < 2000)
                windingAnim++
            if (!(place_meeting(x, (y + 1), obj_railparent)))
                hsp = (xscale * movespeed)
            else
            {
                var _railinst = instance_place(x, (y + 1), obj_railparent)
                hsp = ((xscale * movespeed) + (_railinst.movespeed * _railinst.dir))
            }
            if grounded
            {
                if (scr_slope() && hsp != 0 && movespeed > 10 && movespeed < 18)
                    scr_player_addslopemomentum(0.2, 0.4)
                if (movespeed < 12)
                    movespeed += 0.1
            }
            if (move == xscale && grounded && movespeed < 20)
                movespeed += 0.025
            mach2 = 100
            momemtum = 1
            move = (key_right + key_left)
            move2 = (key_right2 + key_left2)
            if (fightball == 1 && global.coop == 1)
            {
                if (object_index == obj_player1)
                {
                    x = obj_player2.x
                    y = obj_player2.y
                }
                if (object_index == obj_player2)
                {
                    x = obj_player1.x
                    y = obj_player1.y
                }
            }
            if (sprite_index == spr_crazyrun)
            {
                with (instance_create(x, y, obj_dashcloud))
                {
                    image_xscale = other.xscale
                    sprite_index = spr_flamecloud
                }
            }
            crouchslideAnim = 1
            if ((!key_jump2) && jumpstop == 0 && vsp < 0.5)
            {
                vsp /= 20
                jumpstop = 1
            }
            if (grounded && vsp > 0)
                jumpstop = 0
            if (input_buffer_jump < 8 && sprite_index != spr_mach3jump && grounded && (!((move == 1 && xscale == -1))) && (!((move == -1 && xscale == 1))))
            {
                scr_soundeffect(sfx_jump)
                if (sprite_index != spr_fightball)
                {
                    image_index = 0
                    sprite_index = spr_mach3jump
                }
                if (character == "P")
                    vsp = -11
                else
                    vsp = -13
            }
            if (fightball == 0)
            {
                if (sprite_index == spr_mach3jump && floor(image_index) == (image_number - 1))
                    sprite_index = spr_mach4
                if (floor(image_index) == (image_number - 1) && (sprite_index == spr_rollgetup || sprite_index == spr_mach3hit || sprite_index == spr_dashpadmach))
                    sprite_index = spr_mach4
                if (sprite_index == spr_mach2jump && grounded && vsp > 0)
                    sprite_index = spr_mach4
                if (movespeed > 16 && sprite_index != spr_crazyrun && sprite_index != spr_player_Sjumpcancelstart && sprite_index != spr_taunt)
                {
                    flash = 1
                    sprite_index = spr_crazyrun
                }
                else if (movespeed <= 16 && sprite_index == spr_crazyrun)
                    sprite_index = spr_mach4
            }
            if (sprite_index == spr_crazyrun && (!instance_exists(crazyruneffectid)))
            {
                with (instance_create(x, y, obj_crazyrunothereffect))
                {
                    playerid = other.object_index
                    other.crazyruneffectid = id
                }
            }
            if (sprite_index == spr_mach4 || sprite_index == spr_fightball)
                image_speed = 0.4
            else if (sprite_index == spr_crazyrun)
                image_speed = 0.75
            else if (sprite_index == spr_rollgetup || sprite_index == spr_mach3hit || sprite_index == spr_dashpadmach)
                image_speed = 0.4
            if key_jump
                input_buffer_jump = 0
            if (((!key_attack) && fightball == 0 && (!launched) && sprite_index != spr_dashpadmach && grounded && (character == "P" || character == "N")) || (character == "S" && (move == 0 || move != xscale) && grounded && fightball == 0))
            {
                if (!launch)
                {
                    sprite_index = spr_machslidestart
                    scr_soundeffect(sfx_break)
                    state = states.machslide
                    image_index = 0
                    launched = 0
                }
                else
                {
                    xscale *= -1
                    sprite_index = spr_dashpadmach
                    image_index = 0
                    state = states.mach3
                    movespeed = 14
                    launched = 1
                    launch = 0
                    launch_buffer = 60
                }
            }
            if (move == (-xscale) && grounded && (character == "P" || character == "N") && fightball == 0 && sprite_index != spr_dashpadmach)
            {
                scr_soundeffect(sfx_machslideboost)
                sprite_index = spr_mach3boost
                state = states.machslide
                image_index = 0
            }
            if (key_down && fightball == 0)
            {
                particle_set_scale((5 << 0), xscale, 1)
                create_particle(x, y, (5 << 0), 0)
                flash = 0
                state = states.tumble
                vsp = 10
                if (!grounded)
                    sprite_index = spr_player_dive
                else
                    sprite_index = spr_player_machroll
                if (character == "V")
                    sprite_index = spr_playerV_divekickstart
            }
            if (grounded && (place_meeting((x + sign(hsp)), (y - 16), obj_solid) || scr_solid_slope((x + sign(hsp)), (y - 16))) && (!(place_meeting((x + hsp), y, obj_destructibles))) && (!(place_meeting((x + hsp), y, obj_mach3solid))) && (!(place_meeting((x + hsp), y, obj_metalblock))) && place_meeting(x, (y + 1), obj_slope))
            {
                wallspeed = movespeed
                state = states.climbwall
            }
            if ((!grounded && (place_meeting(x + hsp, y, obj_solid) || scr_solid_slope(x + hsp, y)) && !place_meeting(x + hsp, y, obj_destructibles) && !place_meeting(x + hsp, y, obj_mach3solid) && !place_meeting(x + hsp, y, obj_metalblock)) || (grounded && (place_meeting(x + sign(hsp), y - 16, obj_solid) || scr_solid_slope(x + sign(hsp), y - 16)) && !place_meeting(x + hsp, y, obj_destructibles) && !place_meeting(x + hsp, y, obj_mach3solid) && !place_meeting(x + hsp, y, obj_metalblock) && place_meeting(x, y + 1, obj_slope)))
            {
                wallspeed = movespeed
                state = states.climbwall
            }
            if (grounded && scr_solid((x + 1), y) && (!(place_meeting((x + 1), y, obj_mach3solid))) && xscale == 1 && (!scr_slope()) && (scr_solid_slope((x + sign(hsp)), y) || place_meeting((x + sign(hsp)), y, obj_solid)) && (!(place_meeting((x + sign(hsp)), y, obj_metalblock))) && (!(place_meeting((x + sign(hsp)), y, obj_destructibles))) && (!(place_meeting((x + sign(hsp)), y, obj_climbablewall))))
            {
                var _bump = ledge_bump((vsp >= 0 ? 32 : 22))
                if _bump
                {
                    if (fightball == 0)
                    {
                        sprite_index = spr_hitwall
                        scr_soundeffect(sfx_groundpound)
                        scr_soundeffect(sfx_bumpwall)
                        with (obj_camera)
                        {
                            shake_mag = 20
                            shake_mag_acc = (40 / room_speed)
                        }
                        hsp = 0
                        with (obj_baddie)
                        {
                            if (point_in_camera(x, y, view_camera[0]) && grounded)
                            {
                                stun = 1
                                alarm[0] = 200
                                ministun = 0
                                vsp = -5
                                hsp = 0
                            }
                        }
                        flash = 0
                        state = states.bump
                        hsp = -6
                        vsp = -6
                        mach2 = 0
                        image_index = 0
                        instance_create((x + 10), (y + 10), obj_bumpeffect)
                    }
                    else if (fightball == 1)
                    {
                        with (obj_player)
                        {
                            sprite_index = spr_hitwall
                            scr_soundeffect(sfx_groundpound)
                            scr_soundeffect(sfx_bumpwall)
                            with (obj_camera)
                            {
                                shake_mag = 20
                                shake_mag_acc = (40 / room_speed)
                            }
                            hsp = 0
                            with (obj_baddie)
                            {
                                if point_in_camera(x, y, view_camera[0])
                                {
                                    stun = 1
                                    alarm[0] = 200
                                    ministun = 0
                                    vsp = -5
                                    hsp = 0
                                }
                            }
                            flash = 0
                            state = states.bump
                            hsp = -6
                            vsp = -6
                            mach2 = 0
                            image_index = 0
                            instance_create((x + 10), (y + 10), obj_bumpeffect)
                        }
                        fightball = 0
                    }
                }
            }
            if (scr_solid((x - 1), y) && (!(place_meeting((x - 1), y, obj_mach3solid))) && xscale == -1 && (!scr_slope()) && (scr_solid_slope((x + sign(hsp)), y) || place_meeting((x + sign(hsp)), y, obj_solid)) && (!(place_meeting((x + sign(hsp)), y, obj_metalblock))) && (!(place_meeting((x + sign(hsp)), y, obj_destructibles))) && (!(place_meeting((x + sign(hsp)), y, obj_climbablewall))))
            {
                _bump = ledge_bump((vsp >= 0 ? 32 : 22))
                if _bump
                {
                    if (fightball == 0)
                    {
                        sprite_index = spr_hitwall
                        scr_soundeffect(sfx_groundpound)
                        scr_soundeffect(sfx_bumpwall)
                        with (obj_camera)
                        {
                            shake_mag = 20
                            shake_mag_acc = (40 / room_speed)
                        }
                        hsp = 0
                        with (obj_baddie)
                        {
                            if point_in_camera(x, y, view_camera[0])
                            {
                                stun = 1
                                alarm[0] = 200
                                ministun = 0
                                vsp = -5
                                hsp = 0
                            }
                        }
                        flash = 0
                        state = states.bump
                        hsp = 6
                        vsp = -6
                        mach2 = 0
                        image_index = 0
                        instance_create((x - 10), (y + 10), obj_bumpeffect)
                    }
                    else if (fightball == 1)
                    {
                        with (obj_player)
                        {
                            sprite_index = spr_hitwall
                            scr_soundeffect(sfx_groundpound)
                            scr_soundeffect(sfx_bumpwall)
                            with (obj_camera)
                            {
                                shake_mag = 20
                                shake_mag_acc = (40 / room_speed)
                            }
                            hsp = 0
                            with (obj_baddie)
                            {
                                if point_in_camera(x, y, view_camera[0])
                                {
                                    stun = 1
                                    alarm[0] = 200
                                    ministun = 0
                                    vsp = -5
                                    hsp = 0
                                }
                            }
                            flash = 0
                            state = states.bump
                            hsp = 6
                            vsp = -6
                            mach2 = 0
                            image_index = 0
                            instance_create((x + 10), (y + 10), obj_bumpeffect)
                        }
                        fightball = 0
                    }
                }
            }
            break;
        case "V":
            if (windingAnim < 2000)
                windingAnim++
            if ((!(place_meeting(x, (y + 1), obj_railh))) && (!(place_meeting(x, (y + 1), obj_railh2))))
                hsp = (xscale * movespeed)
            else if place_meeting(x, (y + 1), obj_railh)
                hsp = ((xscale * movespeed) - 5)
            else if place_meeting(x, (y + 1), obj_railh2)
                hsp = ((xscale * movespeed) + 5)
            mach2 = 100
            momemtum = 1
            move = (key_right + key_left)
            move2 = (key_right2 + key_left2)
            if (fightball == 1 && global.coop == 1)
            {
                if (object_index == obj_player1)
                {
                    x = obj_player2.x
                    y = obj_player2.y
                }
                if (object_index == obj_player2)
                {
                    x = obj_player1.x
                    y = obj_player1.y
                }
            }
            if (movespeed < 24 && grounded)
            {
                if ((!instance_exists(crazyruneffectid)) && grounded)
                {
                    with (instance_create(x, y, obj_crazyruneffect))
                    {
                        playerid = other.object_index
                        other.crazyruneffectid = id
                    }
                    if (sprite_index == spr_crazyrun)
                    {
                        with (instance_create(x, y, obj_dashcloud))
                        {
                            image_xscale = other.xscale
                            sprite_index = spr_flamecloud
                        }
                    }
                }
            }
            crouchslideAnim = 1
            if ((!key_jump2) && jumpstop == 0 && vsp < 0.5)
            {
                vsp /= 20
                jumpstop = 1
            }
            if (grounded && vsp > 0)
                jumpstop = 0
            if (input_buffer_jump < 8 && grounded && (!((move == 1 && xscale == -1))) && (!((move == -1 && xscale == 1))))
            {
                scr_soundeffect(sfx_jump)
                if (sprite_index != spr_fightball)
                {
                    image_index = 0
                    sprite_index = spr_mach3jump
                }
                vsp = -11
            }
            if (fightball == 0)
            {
                if (sprite_index == spr_mach3jump && floor(image_index) == (image_number - 1))
                    sprite_index = spr_mach4
                if (floor(image_index) == (image_number - 1) && (sprite_index == spr_rollgetup || sprite_index == spr_mach3hit || sprite_index == spr_dashpadmach))
                    sprite_index = spr_mach4
                if (sprite_index == spr_mach2jump && grounded && vsp > 0)
                    sprite_index = spr_mach4
                if (movespeed > 20 && sprite_index != spr_crazyrun && sprite_index != spr_taunt && sprite_index != spr_player_Sjumpcancelstart)
                {
                    flash = 1
                    sprite_index = spr_crazyrun
                }
                else if (movespeed <= 20 && sprite_index == spr_crazyrun)
                    sprite_index = spr_mach4
            }
            if (sprite_index == spr_crazyrun && (!instance_exists(crazyruneffectid)))
            {
                with (instance_create(x, y, obj_crazyrunothereffect))
                {
                    playerid = other.object_index
                    other.crazyruneffectid = id
                }
            }
            if (key_jump && (!grounded))
            {
                image_index = 0
                sprite_index = spr_player_Sjumpcancelstart
            }
            if (grounded && (sprite_index == spr_player_Sjumpcancelstart || sprite_index == spr_taunt))
                sprite_index = spr_mach4
            if (floor(image_index) == 0 && sprite_index == spr_player_Sjumpcancelstart)
            {
                scr_soundeffect(sfx_taunt)
                taunttimer = 20
                tauntstoredsprite = sprite_index
                image_index = random_range(0, 11)
                sprite_index = spr_taunt
                with (instance_create(x, y, obj_taunteffect))
                    player = other.id
            }
            if (sprite_index == spr_taunt)
                taunttimer--
            else
                tauntimer = 0
            if (taunttimer <= 0 && sprite_index == spr_taunt)
                tauntstoredsprite = sprite_index
            if (sprite_index == spr_mach4 || sprite_index == spr_fightball)
                image_speed = 0.4
            else if (sprite_index == spr_crazyrun)
                image_speed = 0.75
            else if (sprite_index == spr_rollgetup || sprite_index == spr_mach3hit)
                image_speed = 0.4
            if key_jump
                input_buffer_jump = 0
            if (((!key_attack) && fightball == 0 && grounded) || (character == "S" && (move == 0 || move != xscale) && grounded && fightball == 0))
            {
                sprite_index = spr_machslidestart
                scr_soundeffect(sfx_break)
                state = states.machslide
                image_index = 0
            }
            if (move == (-xscale) && grounded && fightball == 0)
            {
                scr_soundeffect(sfx_machslideboost)
                sprite_index = spr_mach3boost
                state = states.machslide
                image_index = 0
            }
            if (key_down && fightball == 0 && (!(place_meeting(x, y, obj_dashpad))))
            {
                particle_set_scale((5 << 0), xscale, 1)
                create_particle(x, y, (5 << 0), 0)
                flash = 0
                state = states.machroll
                vsp = 10
            }
            if (((!grounded) && place_meeting((x + hsp), y, obj_solid) && (!(place_meeting((x + sign(hsp)), y, (235 || scr_solid_slope((x + sign(hsp)), y))))) && (!(place_meeting((x + hsp), y, obj_mach3solid)))) || (grounded && (place_meeting((x + hsp), (y - 32), obj_solid) || scr_solid_slope((x + sign(hsp)), (y - 32))) && place_meeting(x, (y + 1), obj_slope) && (!(place_meeting((x + hsp), y, obj_mach3solid)))))
            {
                wallspeed = 10
                state = states.climbwall
            }
            if (scr_solid((x + 1), y) && (!(place_meeting((x + 1), y, obj_mach3solid))) && xscale == 1 && (!scr_slope()) && ((!(place_meeting((x + sign(hsp)), y, obj_slope))) || place_meeting((x + sign(hsp)), y, obj_solid)) && (grounded || fightball == 1))
            {
                if (fightball == 0)
                {
                    sprite_index = spr_hitwall
                    scr_soundeffect(sfx_groundpound)
                    scr_soundeffect(sfx_bumpwall)
                    with (obj_camera)
                    {
                        shake_mag = 20
                        shake_mag_acc = (40 / room_speed)
                    }
                    hsp = 0
                    image_speed = 0.35
                    with (obj_baddie)
                    {
                        if point_in_camera(x, y, view_camera[0])
                        {
                            stun = 1
                            alarm[0] = 200
                            ministun = 0
                            vsp = -5
                            hsp = 0
                        }
                    }
                    flash = 0
                    state = states.bump
                    hsp = -2.5
                    vsp = -3
                    mach2 = 0
                    image_index = 0
                    instance_create((x + 10), (y + 10), obj_bumpeffect)
                }
                else if (fightball == 1)
                {
                    with (obj_player)
                    {
                        sprite_index = spr_hitwall
                        scr_soundeffect(sfx_groundpound)
                        scr_soundeffect(sfx_bumpwall)
                        with (obj_camera)
                        {
                            shake_mag = 20
                            shake_mag_acc = (40 / room_speed)
                        }
                        hsp = 0
                        image_speed = 0.35
                        with (obj_baddie)
                        {
                            if point_in_camera(x, y, view_camera[0])
                            {
                                stun = 1
                                alarm[0] = 200
                                ministun = 0
                                vsp = -5
                                hsp = 0
                            }
                        }
                        flash = 0
                        state = states.bump
                        hsp = -2.5
                        vsp = -3
                        mach2 = 0
                        image_index = 0
                        instance_create((x + 10), (y + 10), obj_bumpeffect)
                    }
                    fightball = 0
                }
            }
            if (scr_solid((x - 1), y) && (!(place_meeting((x - 1), y, obj_mach3solid))) && xscale == -1 && (!scr_slope()) && ((!(place_meeting((x + sign(hsp)), y, obj_slope))) || place_meeting((x + sign(hsp)), y, obj_solid)) && (grounded || fightball == 1))
            {
                if (fightball == 0)
                {
                    sprite_index = spr_hitwall
                    scr_soundeffect(sfx_groundpound)
                    scr_soundeffect(sfx_bumpwall)
                    with (obj_camera)
                    {
                        shake_mag = 20
                        shake_mag_acc = (40 / room_speed)
                    }
                    hsp = 0
                    image_speed = 0.35
                    with (obj_baddie)
                    {
                        if point_in_camera(x, y, view_camera[0])
                        {
                            stun = 1
                            alarm[0] = 200
                            ministun = 0
                            vsp = -5
                            hsp = 0
                        }
                    }
                    flash = 0
                    state = states.bump
                    hsp = 2.5
                    vsp = -3
                    mach2 = 0
                    image_index = 0
                    instance_create((x - 10), (y + 10), obj_bumpeffect)
                }
                else if (fightball == 1)
                {
                    with (obj_player)
                    {
                        sprite_index = spr_hitwall
                        scr_soundeffect(sfx_groundpound)
                        scr_soundeffect(sfx_bumpwall)
                        with (obj_camera)
                        {
                            shake_mag = 20
                            shake_mag_acc = (40 / room_speed)
                        }
                        hsp = 0
                        image_speed = 0.35
                        with (obj_baddie)
                        {
                            if point_in_camera(x, y, view_camera[0])
                            {
                                stun = 1
                                alarm[0] = 200
                                ministun = 0
                                vsp = -5
                                hsp = 0
                            }
                        }
                        flash = 0
                        state = states.bump
                        hsp = -2.5
                        vsp = -3
                        mach2 = 0
                        image_index = 0
                        instance_create((x + 10), (y + 10), obj_bumpeffect)
                    }
                    fightball = 0
                }
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
                    playerid = other.id
                    other.dynamite_inst = id
                    movespeed = (other.movespeed + 4)
                    vsp = -6
                }
            }
            break;
        case "N":
            hsp = (xscale * movespeed)
            move = (key_right + key_left)
            if (fightball == 0)
                vsp = 0
            if (key_up && fightball == 0)
                vsp = -3
            if (key_down && fightball == 0)
                vsp = 3
            if (movespeed < 24 && move == xscale)
            {
                if ((!instance_exists(crazyruneffectid)) && grounded)
                {
                    with (instance_create(x, y, obj_crazyruneffect))
                    {
                        playerid = other.object_index
                        other.crazyruneffectid = id
                    }
                    if (sprite_index == spr_crazyrun)
                    {
                        with (instance_create(x, y, obj_dashcloud))
                        {
                            image_xscale = other.xscale
                            sprite_index = spr_flamecloud
                        }
                    }
                }
            }
            if (key_attack2 && character == "N" && fightball == 0)
            {
                sprite_index = spr_playerN_pogostart
                image_index = 0
                state = states.pogo
                pogospeed = movespeed
            }
            if (fightball == 0)
            {
                if (movespeed > 20 && sprite_index != spr_crazyrun)
                {
                    flash = 1
                    sprite_index = spr_crazyrun
                }
                else if (movespeed <= 20 && sprite_index == spr_crazyrun)
                    sprite_index = spr_playerN_jetpackboost
            }
            if (character == "N" && key_jump2 && fightball == 0)
            {
                scr_soundeffect(sfx_jump)
                scr_soundeffect(sfx_woosh)
                jumpstop = 0
                vsp = -15
                state = states.jump
                sprite_index = spr_playerN_noisebombspinjump
                image_index = 0
                particle_set_scale((5 << 0), xscale, 1)
                create_particle(x, y, (5 << 0), 0)
            }
            if (key_down && fightball == 0 && (!(place_meeting(x, y, obj_dashpad))) && grounded)
            {
                with (instance_create(x, y, obj_jumpdust))
                    image_xscale = other.xscale
                flash = 0
                sprite_index = spr_playerN_jetpackslide
                state = states.machroll
            }
            if ((!key_jump2) && jumpstop == 0 && vsp < 0.5 && fightball == 1)
            {
                vsp /= 20
                jumpstop = 1
            }
            if (grounded && vsp > 0 && fightball == 1)
                jumpstop = 0
            if (input_buffer_jump < 8 && grounded && (!((move == 1 && xscale == -1))) && (!((move == -1 && xscale == 1))) && fightball == 1)
            {
                scr_soundeffect(sfx_jump)
                if (sprite_index != spr_fightball)
                {
                    image_index = 0
                    sprite_index = spr_mach3jump
                }
                vsp = -11
            }
            if (scr_solid((x + sign(hsp)), y) && (!(place_meeting((x + sign(hsp)), y, obj_mach3solid))) && ((!(place_meeting((x + sign(hsp)), y, obj_slope))) || place_meeting((x + sign(hsp)), y, obj_solid)) && (!(place_meeting((x + sign(hsp)), y, obj_metalblock))) && character != "V" && (!(place_meeting((x + sign(hsp)), y, obj_destructibles))) && character != "V" && (!(place_meeting((x + sign(hsp)), y, obj_hungrypillar))))
            {
                pizzapepper = 0
                sprite_index = spr_hitwall
                scr_soundeffect(sfx_groundpound)
                scr_soundeffect(sfx_bumpwall)
                with (obj_camera)
                {
                    shake_mag = 20
                    shake_mag_acc = (40 / room_speed)
                }
                hsp = 0
                image_speed = 0.35
                with (obj_baddie)
                {
                    if point_in_camera(x, y, view_camera[0])
                    {
                        stun = 1
                        alarm[0] = 200
                        ministun = 0
                        vsp = -5
                        hsp = 0
                    }
                }
                flash = 0
                state = states.bump
                hsp = 2.5
                vsp = -3
                mach2 = 0
                image_index = 0
                instance_create((x - 10), (y + 10), obj_bumpeffect)
            }
            break;
    }

    if ((!instance_exists(dashcloudid)) && grounded && (!(place_meeting(x, (y + 1), obj_water))))
    {
        with (instance_create(x, y, obj_superdashcloud))
        {
            if (other.fightball == 1)
                instance_create(obj_player.x, obj_player.y, obj_slapstar)
            image_xscale = other.xscale
            other.dashcloudid = id
        }
    }
    if ((!instance_exists(dashcloudid)) && grounded && place_meeting(x, (y + 1), obj_water))
    {
        with (instance_create(x, y, obj_superdashcloud))
        {
            if (other.fightball == 1)
                instance_create(obj_player.x, obj_player.y, obj_slapstar)
            image_xscale = other.xscale
            sprite_index = spr_watereffect
            other.dashcloudid = id
        }
    }
    if (key_taunt2 && fightball == 0)
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
    if (!instance_exists(chargeeffectid))
    {
        with (instance_create(x, y, obj_chargeeffect))
        {
            playerid = other.object_index
            other.chargeeffectid = id
        }
    }
    if (sprite_index == spr_mach4 || sprite_index == spr_fightball)
        image_speed = 0.4
    else if (sprite_index == spr_crazyrun)
        image_speed = 0.75
    else if (sprite_index == spr_rollgetup || sprite_index == spr_mach3hit)
        image_speed = 0.4
    else
        image_speed = 0.4
    if (key_up && fightball == 0 && character == "P" && grounded && sprite_index != spr_dashpadmach && (!(place_meeting(x, y, obj_dashpad))))
    {
        sprite_index = spr_superjumpprep
        state = states.Sjumpprep
        hsp = 0
        image_index = 0
    }
    if (global.attackstyle == 2 && key_slap2)
    {
        randomize_animations([spr_suplexmash1, spr_suplexmash2, spr_suplexmash3, spr_suplexmash4, 580, 579, 578, spr_punch])
        image_index = 0
        state = states.lungeattack
    }
}

