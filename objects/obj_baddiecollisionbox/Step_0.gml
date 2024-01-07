if ((!instance_exists(baddieID)) && room != custom_lvl_room)
    instance_destroy()
if instance_exists(baddieID)
{
    x = baddieID.x
    y = baddieID.y
    image_xscale = baddieID.image_xscale
}
for (var i = 0; i < 2; i++)
{
    var _obj_player = asset_get_index(concat("obj_player", (i + 1)))
    var _playerindex = (i + 1)
    if (instance_exists(baddieID) && place_meeting(x, y, _obj_player) && _obj_player.cutscene == 0)
    {
        if (baddieID.state != states.grabbed && (!baddieID.invincible) && baddieID.state != states.ghostpossess)
        {
            with (_obj_player)
            {
                if (instance_exists(other.baddieID) && y < other.baddieID.y && attacking == 0 && (!global.kungfu) && sprite_index != spr_player_mach2jump && ((state == states.boots && vsp > 0) || state == states.jump || state == states.mach1 || state == states.grab) && vsp > 0 && other.baddieID.vsp >= 0 && sprite_index != spr_stompprep && (!other.baddieID.invincible))
                {
                    scr_soundeffect(sfx_stompenemy)
                    image_index = 0
                    if (other.baddieID.object_index != obj_tank)
                    {
                        if (x != other.baddieID.x)
                            other.baddieID.image_xscale = (-(sign((other.baddieID.x - x))))
                        other.baddieID.hsp = (xscale * 5)
                        other.baddieID.vsp = -5
                        other.baddieID.state = states.stun
                        if (other.baddieID.stunned < 100)
                            other.baddieID.stunned = 100
                        other.baddieID.xscale = 1.4
                        other.baddieID.yscale = 0.6
                    }
                    if key_jump2
                    {
                        instance_create(x, (y + 50), obj_stompeffect)
                        stompAnim = 1
                        vsp = -14
                        if (state == states.jump)
                            sprite_index = spr_stompprep
                    }
                    else
                    {
                        instance_create(x, (y + 50), obj_stompeffect)
                        stompAnim = 1
                        vsp = -9
                        if (state == states.jump)
                            sprite_index = spr_stompprep
                    }
                }
                if (instance_exists(other.baddieID) && state == states.lungegrab)
                {
                    other.baddieID.grabbedby = _playerindex
                    other.baddieID.state = states.grabbed
                    other.baddieID.hp = -99
                    if key_down
                    {
                        sprite_index = spr_piledriver
                        vsp = -5
                        state = states.superslam
                        image_index = 0
                        image_speed = 0.35
                    }
                    else
                    {
                        sprite_index = choose(spr_finishingblow1, spr_finishingblow2, spr_finishingblow3, spr_finishingblow4, spr_finishingblow5)
                        image_index = 0
                        hsp = 0
                        movespeed = 0
                        state = states.finishingblow
                    }
                }
                if (instance_exists(other.baddieID) && other.baddieID.state != (204 << 0) && (!other.baddieID.invincible) && state == states.ratmountattack)
                {
                    other.baddieID.ratplayerid = id
                    other.baddieID.state = (204 << 0)
                    ratgrabbedID = other.baddieID.id
                    state = states.ratmount
                }
                if (instance_exists(other.baddieID) && other.baddieID.invtime == 0 && ((other.baddieID.object_index != obj_bigcheese && other.baddieID.object_index != obj_pepbat) || state != states.tumble) && ((state == states.handstandjump && global.attackstyle == 1) || instakillmove == 1) && other.baddieID.state != states.grabbed && (!other.baddieID.invincible) && other.baddieID.instantkillable)
                {
                    if (state == states.mach3 && sprite_index != spr_mach3hit && (character == "P" || character == "V"))
                    {
                        if (fightball == 0)
                            sprite_index = spr_mach3hit
                        image_index = 0
                    }
                    if (state == states.chainsawbump && sprite_index != spr_player_chainsawhit)
                    {
                        image_index = 0
                        sprite_index = spr_player_chainsawhit
                    }
                    other.baddieID.invtime = 25
                    if (object_index == obj_player1)
                        other.baddieID.grabbedby = 1
                    else
                        other.baddieID.grabbedby = 2
                    scr_soundeffect(sfx_punch)
                    if (!other.baddieID.important)
                    {
                        if (state == states.mach3)
                            global.style += (10 + global.combo)
                        else
                            global.style += (5 + global.combo)
                    }
                    if (state == states.mach3)
                        other.baddieID.mach3destroy = 1
                    if ((!other.baddieID.killprotection) && (!global.kungfu))
                    {
                        other.baddieID.hp -= 99
                        other.baddieID.instakilled = 1
                    }
                    if (!other.baddieID.important)
                    {
                        global.combotime = 60
                        global.heattime = 60
                        global.combo += 1
                    }
                    global.hit += 1
                    if (supercharge < 10)
                        supercharge += 1
                    if ((!grounded) && state != states.freefall && (key_jump2 || input_buffer_jump == 0))
                    {
                        if (state == states.mach3 && fightball == 0)
                            sprite_index = spr_player_mach2jump
                        suplexmove = 0
                        vsp = -11
                    }
                    if (character == "M" && state == states.freefall)
                    {
                        vsp = -11
                        state = states.jump
                        sprite_index = spr_jump
                    }
                    if (state != states.chainsaw)
                    {
                        tauntstoredmovespeed = movespeed
                        tauntstoredsprite = sprite_index
                        tauntstoredstate = state
                        tauntstoredvsp = vsp
                    }
                    if (state == states.handstandjump && (!key_slap))
                    {
                        image_index = random_range(0, (image_number - 1))
                        if grounded
                            sprite_index = spr_player_groundedattack
                        else
                            sprite_index = spr_player_ungroundedattack
                    }
                    if (state == states.chainsawbump && (!global.kungfu))
                    {
                        other.baddieID.hp -= 99
                        sprite_index = spr_player_chainsawhit
                        image_index = 0
                    }
                    var lag = 5
                    other.baddieID.hitLag = lag
                    other.baddieID.hitX = other.baddieID.x
                    other.baddieID.hitY = other.baddieID.y
                    other.baddieID.hp -= 1
                    hitLag = lag
                    hitX = x
                    hitY = y
                    instance_create(other.baddieID.x, other.baddieID.y, obj_parryeffect)
                    other.baddieID.alarm[3] = 3
                    other.baddieID.state = states.hit
                    other.baddieID.image_xscale = (-xscale)
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
                    if key_up
                    {
                        other.baddieID.hitvsp = -11
                        other.baddieID.hithsp = 0
                    }
                    else if key_down
                    {
                        other.baddieID.hitvsp = 11
                        other.baddieID.hithsp = 0
                    }
                    else
                    {
                        other.baddieID.hitvsp = -2
                        other.baddieID.hithsp = ((-other.baddieID.image_xscale) * 8)
                    }
                    state = states.chainsaw
                }
                else if (state == states.handstandjump && global.attackstyle == 0)
                {
                    if (sprite_index == spr_suplexdash)
                    {
                        image_index = 0
                        sprite_index = spr_haulingstart
                        state = states.grab
                        baddiegrabbedID = other.baddieID
                        grabbingenemy = 1
                        other.baddieID.state = states.grabbed
                        other.baddieID.grabbedby = _playerindex
                    }
                    else if (sprite_index == spr_player_lunge)
                        DoFinisher()
                }
                else if (state == states.handstandjump && global.attackstyle == 3)
                {
                    var _ms = movespeed
                    movespeed = 0
                    baddiegrabbedID = other.baddieID
                    grabbingenemy = 1
                    var _prevstate = other.baddieID.state
                    other.baddieID.state = states.grabbed
                    other.baddieID.grabbedby = _playerindex
                    if global.pummeltest
                    {
                        if (image_index > 6)
                        {
                            if key_up
                            {
                                state = states.finishingblow
                                sprite_index = spr_uppercutfinishingblow
                                image_index = 4
                                movespeed = 0
                            }
                            else if key_down
                            {
                                sprite_index = spr_piledriver
                                vsp = -5
                                state = states.superslam
                                image_index = 4
                                image_speed = 0.35
                            }
                            else
                            {
                                state = states.finishingblow
                                sprite_index = spr_player_lungehit
                                image_index = 0
                            }
                        }
                        else
                        {
                            other.baddieID.state = _prevstate
                            grabbingenemy = 0
                            movespeed = _ms
                        }
                    }
                    else
                    {
                        image_index = 0
                        if key_up
                        {
                            state = states.finishingblow
                            sprite_index = spr_uppercutfinishingblow
                            image_index = 4
                            movespeed = 0
                        }
                        else if key_down
                        {
                            sprite_index = spr_piledriver
                            vsp = -5
                            state = states.superslam
                            image_index = 4
                            image_speed = 0.35
                        }
                        else
                        {
                            state = states.finishingblow
                            sprite_index = spr_player_lungehit
                            image_index = 0
                        }
                    }
                }
                if (place_meeting(x, (y + 1), other) && state == states.pogo && vsp > 0 && other.baddieID.vsp >= 0 && sprite_index != spr_playerN_pogobounce && (!other.baddieID.invincible))
                {
                    switch pogochargeactive
                    {
                        case 0:
                            pogospeedprev = 0
                            other.baddieID.vsp = -3
                            scr_soundeffect(sfx_stompenemy)
                            other.baddieID.state = states.stun
                            if (other.baddieID.stunned < 100)
                                other.baddieID.stunned = 100
                            sprite_index = spr_playerN_pogobounce
                            break;
                        case 1:
                            pogospeedprev = 0
                            scr_throwenemy()
                            sprite_index = spr_playerN_pogobouncemach
                            break;
                    }

                    instance_create(x, (y + 50), obj_stompeffect)
                    image_index = 0
                    movespeed = 0
                    vsp = 0
                }
                var pepp_grab = 0
                if (character == "M" && instance_exists(other.baddieID) && (state == states.normal || state == states.jump) && pepperman_grabID == -4 && sprite_index != spr_pepperman_throw && other.baddieID.state == states.stun && other.baddieID.stuntouchbuffer == 0 && (!other.baddieID.thrown) && (!other.baddieID.invincible))
                {
                    other.baddieID.pepperman_grab = 1
                    pepperman_grabID = other.baddieID.id
                    other.baddieID.state = states.grabbed
                    other.baddieID.grabbedby = _playerindex
                    pepp_grab = 1
                }
                if (instance_exists(other.baddieID) && other.baddieID.object_index != obj_bigcheese && (state == states.tumble || state == states.mach2) && other.baddieID.state != states.punch && other.baddieID.state != states.hit && (!pepp_grab) && other.baddieID.thrown == 0 && other.baddieID.stuntouchbuffer <= 0 && other.baddieID.state != states.grabbed && other.baddieID.state != states.chainsawbump && other.baddieID.state != states.chainsaw && (!other.baddieID.invincible))
                {
                    lag = 5
                    other.baddieID.stuntouchbuffer = 15
                    with (other.baddieID)
                    {
                        xscale = 0.8
                        yscale = 1.3
                        hp -= 1
                        instance_create(x, y, obj_bangeffect)
                        state = states.hit
                        image_xscale = (-other.xscale)
                        hithsp = (((other.x + (((other.movespeed + 0.5) * 60) * other.xscale)) - x) / 60)
                        hitvsp = (((other.y - 180) - y) / 60)
                        trace([hithsp, hitvsp])
                        hitLag = lag
                        hitX = x
                        hitY = y
                        invtime = (lag + 5)
                        flash = 1
                    }
                    tauntstoredstate = state
                    tauntstoredsprite = sprite_index
                    tauntstoredmovespeed = movespeed
                    tauntstoredvsp = 0
                    state = states.chainsaw
                    hitLag = lag
                    hitX = x
                    hitY = y
                    scr_soundeffect(sfx_killingblow)
                    repeat (2)
                    {
                        with (create_debris(x, y, spr_slapstar))
                            vsp = irandom_range(-6, -11)
                    }
                    instance_create(other.x, other.y, obj_parryeffect)
                }
                if (character != "M" && instance_exists(other.baddieID) && state == states.grabbing && (!other.baddieID.invincible))
                {
                    if (instance_exists(other.baddieID) && y < (other.baddieID.y - 50) && attacking == 0 && state != states.handstandjump && other.baddieID.state != states.grabbed && sprite_index != spr_player_mach2jump && (state == states.jump || state == states.mach1 || (state == states.grab && sprite_index != spr_swingding)) && vsp > 0 && other.baddieID.vsp >= 0 && sprite_index != spr_stompprep && (!other.baddieID.invincible))
                    {
                        scr_soundeffect(sfx_stompenemy)
                        if (x != other.baddieID.x)
                            other.baddieID.image_xscale = (-(sign((other.baddieID.x - x))))
                        image_index = 0
                        other.baddieID.state = states.stun
                        if (other.baddieID.stunned < 100)
                            other.baddieID.stunned = 100
                        if key_jump2
                        {
                            instance_create(x, (y + 50), obj_stompeffect)
                            stompAnim = 1
                            other.baddieID.image_index = 0
                            vsp = -14
                            if (state != states.grab)
                                sprite_index = spr_stompprep
                        }
                        else
                        {
                            instance_create(x, (y + 50), obj_stompeffect)
                            stompAnim = 1
                            other.baddieID.image_index = 0
                            vsp = -9
                            if (state != states.grab)
                                sprite_index = spr_stompprep
                        }
                    }
                    if (other.baddieID.thrown == 0 && (character == "P" || character == "N"))
                    {
                        movespeed = 0
                        image_index = 0
                        sprite_index = spr_haulingstart
                        state = states.grab
                        other.baddieID.state = states.grabbed
                        other.baddieID.grabbedby = _playerindex
                    }
                }
            }
        }
    }
}
