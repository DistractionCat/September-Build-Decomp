if (room == rm_editor)
    return;
switch state
{
    case states.idle:
        scr_enemy_idle()
        break;
    case states.turn:
        scr_enemy_turn()
        break;
    case states.walk:
        scr_enemy_walk()
        break;
    case states.land:
        scr_enemy_land()
        break;
    case states.hit:
        scr_enemy_hit()
        break;
    case states.stun:
        scr_enemy_stun()
        break;
    case states.Throw:
        scr_pizzagoblin_throw()
        break;
    case states.grabbed:
        scr_enemy_grabbed()
        break;
    case states.pummel:
        scr_enemy_pummel()
        break;
    case states.staggered:
        scr_enemy_staggered()
        break;
    case states.rage:
        scr_enemy_rage()
        break;
    case states.ghostpossess:
        scr_enemy_ghostpossess()
        break;
}

if (state == states.throwing)
{
    hsp = 0
    image_xscale = shootdir
    if (floor(image_index) == (image_number - 1))
    {
        state = states.walk
        sprite_index = walkspr
    }
    if (floor(image_index) > 8 && (!shot))
    {
        shot = 1
        with (golfid)
        {
            if (!kicked)
                movespeed = 18
            hsp = (image_xscale * movespeed)
            jspd = 14
            vsp = (-jspd)
            thrown = 1
        }
    }
    if (!shot)
    {
        with (golfid)
        {
            image_xscale = other.image_xscale
            x = (other.x - hsp)
            y = (other.y - vsp)
        }
    }
}
if (state == states.stun && stunned > 100 && birdcreated == 0)
{
    birdcreated = 1
    with (instance_create(x, y, obj_enemybird))
        ID = other.id
}
if (state != states.stun)
    birdcreated = 0
if (flash == 1 && alarm[2] <= 0)
    alarm[2] = (0.15 * room_speed)
scr_scareenemy()
if (state != states.grabbed)
    depth = 0
if (state != states.stun)
    thrown = 0
