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
    case (128 << 0):
        scr_enemy_charge()
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
var targetplayer = (global.coop ? instance_nearest(x, y, obj_player) : obj_player1)
if (targetplayer.x > (x - 400) && targetplayer.x < (x + 400) && y <= (targetplayer.y + 60) && y >= (targetplayer.y - 60))
{
    if (state == states.walk || state == states.idle)
        activated = 1
}
if ((!activated) && (state == states.walk || state == states.idle))
    sprite_index = spr_banditochicken_sleep
if ((state == states.walk || state == states.idle) && activated == 1 && sprite_index != spr_banditochicken_wake && sprite_index != spr_banditochicken_scared)
{
    movespeed = 0
    image_xscale = (-(sign((x - targetplayer.x))))
    image_index = 0
    sprite_index = spr_banditochicken_wake
}
if (sprite_index == spr_banditochicken_wake && floor(image_index) == (image_number - 1))
{
    image_xscale *= -1
    sprite_index = spr_banditochicken_chase
    state = (128 << 0)
    movespeed = 14
    with (instance_create(x, y, obj_jumpdust))
        image_xscale = other.image_xscale
}
if (state == (128 << 0) && bonebuffer > 0)
    bonebuffer--
if (bonebuffer == 0)
{
    if (global.stylethreshold < 3)
    {
        with (instance_create(x, y, obj_banditochicken_projectile))
        {
            vsp = -9
            image_xscale = other.image_xscale
            hsp = ((-image_xscale) * 4)
        }
    }
    else
    {
        flash = 1
        create_heatattack_afterimage(x, y, sprite_index, image_index, image_xscale)
        with (instance_create(x, y, obj_banditochicken_dynamite))
        {
            sprite_index = spr_banditodynamite
            vsp = -9
            image_xscale = other.image_xscale
            hsp = ((-image_xscale) * 4)
        }
    }
    bonebuffer = 25
}
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
