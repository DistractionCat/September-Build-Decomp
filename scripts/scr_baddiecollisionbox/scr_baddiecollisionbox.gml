function baddiecollisionbox_update(argument0) //baddiecollisionbox_update
{
    if (argument0.cutscene == 0 && argument0.state != states.firemouth)
    {
        with (argument0)
        {
            var _destroy = 0
            var _stagger = 0
            if (instance_exists(other.baddieID) && instakillmove == 1 && other.baddieID.state != states.grabbed && other.baddieID.thrown == 0 && (!other.baddieID.invincible) && other.baddieID.instantkillable)
            {
                if (state == states.mach3 && sprite_index != spr_mach3hit && (character == "P" || character == "V"))
                {
                    if (fightball == 0)
                        sprite_index = spr_mach3hit
                    image_index = 0
                    _destroy = 1
                }
                else if (state == states.Sjump || (state == states.freefall && freefallsmash > 10))
                    _destroy = 1
                if ((state == states.mach2 || state == states.machroll) && grounded)
                {
                    machpunchAnim = 1
                    image_index = 0
                }
                if ((!grounded) && state != states.freefall && key_jump2)
                {
                    if (state == states.mach2 || (state == states.mach3 && fightball == 0))
                        sprite_index = spr_mach2jump
                    suplexmove = 0
                    vsp = -11
                }
                if ((!_destroy) && (!_stagger))
                {
                    if (other.baddieID.hp > 0)
                    {
                        _stagger = 1
                        if (state == states.freefall && freefallsmash < 10)
                        {
                            vsp = -11
                            state = states.jump
                            sprite_index = spr_jump
                        }
                    }
                    else
                        _destroy = 1
                }
                if (character == "M" && state == states.freefall)
                {
                    vsp = -11
                    state = states.jump
                    sprite_index = spr_jump
                }
                if _destroy
                {
                    scr_soundeffect(sfx_punch)
                    instance_destroy(other.baddieID)
                    if (!other.baddieID.important)
                    {
                        global.hit += 1
                        global.combotime = 60
                        global.heattime = 60
                    }
                }
                if (_stagger && other.baddieID.state != states.staggered)
                {
                    scr_soundeffect(sfx_bumpwall)
                    with (other.baddieID)
                    {
                        hp -= ((state == states.mach2 || state == states.machroll) ? 1 : 2)
                        state = (hp > 0 ? states.staggered : states.stun)
                        stagger_buffer = stagger_max
                        stagger_dir = other.xscale
                    }
                }
            }
            var pepp_grab = 0
            if (character == "M" && instance_exists(other.baddieID) && (state == states.normal || state == states.jump) && state != states.pummel && pepperman_grabID == -4 && sprite_index != spr_pepperman_throw && other.baddieID.state == states.staggered && other.baddieID.state != states.pummel && other.baddieID.state != states.stun && other.baddieID.stuntouchbuffer == 0 && (!other.baddieID.thrown) && (!other.baddieID.invincible))
            {
                other.baddieID.pepperman_grab = 1
                pepperman_grabID = other.baddieID.id
                other.baddieID.state = states.grabbed
                other.baddieID.grabbedby = (object_index == obj_player1 ? 1 : 2)
                pepp_grab = 1
            }
            if (instance_exists(other.baddieID) && y < other.baddieID.y && attacking == 0 && sprite_index != spr_player_mach2jump && (state == states.jump || state == states.mach1 || state == states.grab) && vsp > 0 && other.baddieID.vsp >= 0 && sprite_index != spr_stompprep && (!other.baddieID.invincible) && other.baddieID.stompable)
            {
                scr_soundeffect(sfx_stompenemy)
                if (x != other.baddieID.x)
                    other.baddieID.image_xscale = (-(sign((other.baddieID.x - x))))
                image_index = 0
                other.baddieID.stagger_buffer = other.baddieID.stagger_max
                other.baddieID.stagger_dir = xscale
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
            if (instance_exists(other.baddieID) && (!pepp_grab) && (!_stagger) && (!_destroy) && other.baddieID.thrown == 0 && other.baddieID.stuntouchbuffer == 0 && other.baddieID.vsp > 0 && state != states.faceplant && state != states.punch && state != states.tackle && state != states.superslam && state != states.pogo && state != states.machslide && state != states.pummel && other.baddieID.state != states.grabbed && other.baddieID.state != states.pummel && state != states.freefall && state != states.grab && state != states.mach2 && state != states.handstandjump && state != states.hurt && other.baddieID.state != (141 << 0) && state != states.mach3 && state != states.machroll && state != states.climbwall && other.baddieID.bumpable && (!other.baddieID.invincible))
            {
                scr_soundeffect(sfx_bumpwall)
                if (state != states.bombpep && state != states.mach1 && state != states.crouchslide && character != "M")
                    movespeed = 0
                other.baddieID.stuntouchbuffer = 50
                if (other.baddieID.object_index == obj_pizzaball)
                    global.golfhit += 1
                if (x != other.baddieID.x)
                    other.baddieID.image_xscale = (-(sign((other.baddieID.x - x))))
                other.baddieID.stagger_buffer = other.baddieID.stagger_max
                other.baddieID.stagger_dir = xscale
                other.baddieID.state = (other.baddieID.hp > 0 ? states.staggered : states.stun)
                other.baddieID.image_index = 0
            }
            if (instance_exists(other.baddieID) && state == states.handstandjump && (!other.baddieID.invincible))
            {
                if (other.baddieID.state != states.stun)
                {
                    state = states.pummel
                    sprite_index = spr_grab
                    image_speed = 0.35
                    image_index = 0
                    other.baddieID.state = states.pummel
                    other.baddieID.grabbedby = (object_index == obj_player1 ? 1 : 2)
                }
                else if (other.baddieID.thrown == 0 && (character == "P" || character == "N"))
                {
                    movespeed = 0
                    image_index = 0
                    sprite_index = spr_haulingstart
                    state = states.grab
                    baddiegrabbedID = other.baddieID
                    other.baddieID.state = states.grabbed
                    other.baddieID.grabbedby = 1
                }
                else
                {
                    if (other.baddieID.thrown == 1 && (!key_up))
                    {
                        other.baddieID.hsp = (xscale * 25)
                        other.baddieID.vsp = 0
                    }
                    else if (!key_up)
                    {
                        other.baddieID.hsp = (xscale * 6)
                        scr_soundeffect(sfx_killingblow)
                        image_index = 0
                        state = states.tackle
                        baddiegrabbedID = other.baddieID
                        movespeed = 0
                        other.baddieID.vsp = -6
                        scr_throwenemy()
                    }
                    else
                    {
                        other.baddieID.vsp = -14
                        other.baddieID.hsp = 0
                    }
                    sprite_index = choose(spr_suplexmash1, spr_suplexmash2, spr_suplexmash3, spr_suplexmash4, spr_punch)
                    scr_soundeffect(sfx_killingblow)
                    image_index = 0
                    state = states.tackle
                    movespeed = 0
                    scr_throwenemy()
                }
            }
        }
    }
}

