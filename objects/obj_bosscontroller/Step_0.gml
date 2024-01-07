if ((!instance_exists(bossID)) && bossID != noone && state != states.victory && (!fakedeath))
{
    state = states.victory
    alarm[1] = (room_speed * 4)
}
if (player_hp <= 0)
{
    fakedeath = 0
    if (state != states.transitioncutscene && state != states.gameover)
    {
        if (endroundfunc != -4)
            self.endroundfunc()
        depth = (obj_player1.depth + 1)
        state = states.transitioncutscene
        with (bossID)
            self.player_destroy(lastplayerid)
    }
    else if (bossID.state != states.chainsaw && state != states.gameover)
    {
        state = states.gameover
        alarm[1] = (room_speed * 4)
    }
}
if instance_exists(bossID)
{
    if (bossID.destroyed && (!fakedeath))
    {
        depth = (bossID.depth + 1)
        state = states.transitioncutscene
    }
}
switch state
{
    case states.arenaintro:
        with (obj_player)
        {
            state = states.actor
            xscale = (x > (room_width / 2) ? -1 : 1)
            image_blend = make_colour_hsv(0, 0, 255)
        }
        with (par_boss)
        {
            state = states.actor
            x = xstart
        }
        if (playerx != 0)
            playerx += 5
        else if (!flashed)
        {
            flash = 1
            flashed = 1
            alarm[2] = (0.15 * room_speed)
        }
        if (bossx != (room_width - sprite_get_width(bossspr)))
            bossx -= 5
        if (vsy != 0)
            vsy += 5
        flamey -= 4
        if (intro_buffer > 0)
            intro_buffer--
        else if use_countdown
            state = (145 << 0)
        else
        {
            state = states.normal
            with (obj_player)
            {
                if (object_index != obj_player2 || global.coop)
                    state = states.normal
            }
            with (par_boss)
                state = states.normal
        }
        break;
    case (145 << 0):
        if (timer_buffer > 0)
        {
            timer_buffer--
            instance_destroy(obj_noisebossbomb)
            with (obj_player)
            {
                if (state != states.actor && state != states.comingoutdoor && state != states.hit && (!instance_exists(obj_fadeout)))
                {
                    if (state == states.hit || state == states.chainsaw)
                    {
                        hitLag = 0
                        x = hitX
                        y = hitY
                    }
                    movespeed = 0
                    hsp = 0
                    vsp = 0
                    sprite_index = spr_idle
                    image_speed = 0.35
                    xscale = (x > (room_width / 2) ? -1 : 1)
                    image_blend = make_colour_hsv(0, 0, 255)
                    state = states.actor
                    visible = true
                    image_alpha = 1
                }
                if (state == states.actor)
                    state_player_arenaround()
            }
            with (par_boss)
            {
                if (state == states.hit || state == states.chainsaw)
                {
                    hitLag = 0
                    x = hitX
                    y = hitY
                }
                if (colliding && state != (180 << 0) && state != (181 << 0))
                {
                    state = (145 << 0)
                    attack_cooldown = attack_max[(phase - 1)]
                }
            }
        }
        else
        {
            if (startroundfunc != -4)
                self.startroundfunc()
            minutes = maxminutes
            seconds = maxseconds
            alarm[0] = room_speed
            state = states.normal
            with (obj_player)
            {
                if (object_index == obj_player1 || global.coop)
                    state = states.normal
            }
            with (par_boss)
                state = states.normal
        }
        break;
    case states.transitioncutscene:
        instance_destroy(obj_baddiespawner)
        instance_destroy(obj_baddie)
        if (player_hp > 0)
        {
            if ((!instance_exists(bossID)) || bossID.state != states.hit)
            {
                fade -= 0.05
                fade = clamp(fade, 0, 1)
            }
        }
        else
        {
            var hit = 0
            with (obj_player)
            {
                if (state == states.hit)
                    hit = 1
            }
            if (!hit)
            {
                fade -= 0.05
                fade = clamp(fade, 0, 1)
            }
        }
        break;
    case states.victory:
    case states.gameover:
        fade -= 0.05
        fade = clamp(fade, 0, 1)
        break;
}

