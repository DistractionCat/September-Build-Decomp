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
if (cooldown > 0)
    cooldown--
if (state == states.walk && cooldown <= 0)
{
    if (targetplayer.x > (x - 200) && targetplayer.x < (x + 200) && targetplayer.y > (y - 200) && targetplayer.y < (y + 200))
    {
        state = states.punch
        sprite_index = spr_player_ratmountattack
        image_index = 0
        if (x != targetplayer.x)
            image_xscale = sign((targetplayer.x - x))
    }
}
if (state == states.punch)
{
    image_speed = 0.35
    hsp = (image_xscale * 5)
    vsp = 0
    if (!instance_exists(hitboxID))
    {
        hitboxID = instance_create(x, y, obj_forkhitbox)
        hitboxID.ID = id
    }
    if (floor(image_index) == (image_number - 1))
    {
        sprite_index = walkspr
        state = states.walk
        instance_destroy(hitboxID)
        cooldown = 80
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
scr_ratblock_destroy()
if (state != states.grabbed)
    depth = 0
if (state != states.stun)
    thrown = 0
