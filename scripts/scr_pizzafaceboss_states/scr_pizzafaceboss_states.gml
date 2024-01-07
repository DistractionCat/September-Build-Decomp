function boss_pizzaface_phase1_decideattack() //boss_pizzaface_phase1_decideattack
{
    if (attackbuffer > 0)
        attackbuffer--
    else
    {
        attackbuffer = attackbuffermax
        if ((!has_attacked) && lostattacks > 0)
        {
            has_attacked = 1
            for (var choseattack = -4; choseattack == -4; choseattack = phase1attacks[(irandom_range(1, array_length(phase1attacks)) - 1)])
            {
            }
            state = choseattack
            switch state
            {
                case (222 << 0):
                    shot = 0
                    break;
                case (224 << 0):
                    eyesbuffer = -1
                    break;
                case (223 << 0):
                    mouthbuffer = 20
                    mouthcount = 5
                    break;
                case (225 << 0):
                    movespeed = 6
                    momentum = 0
                    nosebuffer = 480
                    break;
            }

        }
        else
        {
            has_attacked = 0
            state = (226 << 0)
            ramdir = point_direction(targetplayer.x, targetplayer.y, x, y)
        }
    }
}

function boss_pizzaface_phase1normal() //boss_pizzaface_phase1normal
{
    hsp = 0
    vsp = 0
    y = Approach(y, (room_height / 4), 2)
    x += (floatdir * 5)
    image_xscale = 1
    if place_meeting((x + floatdir), y, obj_solid)
        floatdir *= -1
    if (hp > ((max_hp / 3) * 2))
        boss_pizzaface_phase1_decideattack()
    else
    {
        transitioncutscene = 0
        state = (227 << 0)
    }
}

function boss_pizzaface_ram() //boss_pizzaface_ram
{
    ramdir = angle_rotate(ramdir, point_direction(x, y, targetplayer.x, targetplayer.y), 7)
    var spd = 10
    hsp = lengthdir_x(spd, ramdir)
    vsp = lengthdir_y(spd, ramdir)
    if (y > (room_height / 2))
    {
        if (place_meeting(x, (y + 1), obj_solid) && place_meeting((x + hsp), y, obj_solid))
            state = states.normal
    }
}

function boss_pizzaface_moustache() //boss_pizzaface_moustache
{
    hsp = 0
    if (!grounded)
        vsp = 10
    else if ((!shot) && (!instance_exists(obj_moustachehitbox)))
    {
        shot = 1
        with (instance_create(x, (y + 16), obj_moustachehitbox))
        {
            dir = (x > (room_width / 2) ? 1 : -1)
            depth = (other.depth - 1)
        }
    }
    else if (shot && (!instance_exists(obj_moustachehitbox)))
    {
        state = states.normal
        shot = 0
    }
}

function boss_pizzaface_eyes() //boss_pizzaface_eyes
{
    hsp = 0
    x = Approach(x, (room_width / 2), 5)
    vsp = 0
    if (x == (room_width / 2) && (!grounded))
        vsp = 10
    else if grounded
    {
        if (eyesbuffer == -1)
        {
            eyesbuffer = 30
            with (instance_create((x + 16), y, obj_sausageeyes))
            {
                image_xscale = -1
                depth = (other.depth - 1)
            }
            with (instance_create((x - 16), y, obj_sausageeyes))
            {
                image_xscale = 1
                depth = (other.depth - 1)
            }
        }
        else if (eyesbuffer > 0)
            eyesbuffer--
        else
            state = states.normal
    }
}

function boss_pizzaface_mouth() //boss_pizzaface_mouth
{
    hsp = 0
    vsp = 0
    if (mouthcount > 0)
    {
        if (mouthbuffer > 0)
            mouthbuffer--
        else
        {
            mouthcount--
            mouthbuffer = 60
            instance_create(x, y, obj_wordhitbox)
        }
    }
    else
        state = states.normal
}

function boss_pizzaface_nose() //boss_pizzaface_nose
{
    y = Approach(y, (((room_width / 4) * 3) - 450), 2)
    with (obj_player)
    {
        if (x > (other.x - 70) && x < (other.x + 70))
            vsp = -2
    }
    if (x != targetplayer.x && (!(image_xscale == (-(sign((x - targetplayer.x)))))))
    {
        image_xscale = (-(sign((x - targetplayer.x))))
        momentum = (((-image_xscale) * movespeed) + 4)
    }
    hsp = ((image_xscale * movespeed) + momentum)
    vsp = 0
    momentum = Approach(momentum, 0, 0.2)
    if (nosebuffer > 0)
        nosebuffer--
    else
        state = states.normal
}

