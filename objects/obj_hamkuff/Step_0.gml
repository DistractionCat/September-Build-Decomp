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
        break;
    case states.blockstance:
        if (x != playerid.x)
            image_xscale = (-(sign((x - playerid.x))))
        with (playerid)
        {
            if (state == states.taxi2)
                other.state = states.walk
            else if (!launched)
            {
                var _xs = 0
                if (x != other.x)
                    _xs = (-(sign((x - other.x))))
                var dis = (abs(hsp) < 12 ? 120 : 200)
                var dis2 = 400
                var m = (abs((x - other.x)) > dis ? abs(hsp) : (abs(hsp) - max(0, (abs(hsp) - 2))))
                if (hsp == 0)
                    m = _xs
                hsp_carry = (_xs * abs(m))
                if (state == states.mach3)
                    launch = 1
                if ((state == states.mach3 && abs(hsp) > 15 && abs((x - other.x)) >= dis) || point_distance(x, y, obj_player1.x, obj_player1.y) >= dis2)
                {
                    launch = 0
                    instance_destroy(other)
                }
            }
        }
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
if (state != states.grabbed)
    depth = 0
if (state != states.stun)
    thrown = 0
