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

var targetplayer = instance_nearest(x, y, obj_player)
var _dir = (image_xscale > 0 ? targetplayer.x > (x + 20) : targetplayer.x < (x - 20))
if (cooldown > 0)
    cooldown--
if (state == states.walk && cooldown <= 0 && _dir && scr_monster_detect(300, room_height, targetplayer) && collision_line(x, y, targetplayer.x, targetplayer.y, obj_solid, false, true) == -4)
{
    state = states.punch
    sprite_index = spr_cheeseslime_rage
    image_index = 0
    scr_soundeffect(sfx_scream5)
}
if (state == states.punch)
{
    hsp = 0
    if (floor(image_index) == (image_number - 1))
    {
        state = states.walk
        cooldown = 100
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
if (state != states.grabbed)
    depth = 0
if (state != states.stun)
    thrown = 0
if (boundbox == 0)
{
    with (instance_create(x, y, obj_baddiecollisionbox))
    {
        sprite_index = other.sprite_index
        mask_index = other.sprite_index
        baddieID = other.id
        other.boundbox = 1
    }
}
