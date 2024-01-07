if (room == rm_editor)
    return;
var targetplayer = instance_nearest(x, y, obj_player)
switch state
{
    case states.idle:
        sprite_index = spr_pepgoblin_dead
        if (targetplayer.x > (x - 150) && targetplayer.x < (x + 150) && targetplayer.y > y && targetplayer.y < (y + 200))
        {
            state = states.walk
            hit = 0
        }
        break;
    case (128 << 0):
        scr_enemy_charge()
        break;
    case states.turn:
        sprite_index = spr_pepgoblin
        var dir = point_direction(x, y, xstart, ystart)
        x = Approach(x, xstart, abs(lengthdir_x(5, dir)))
        y = Approach(y, ystart, abs(lengthdir_y(5, dir)))
        if (x > (xstart - 10) && x < (xstart + 10) && y > (ystart - 10) && y < (ystart + 10))
        {
            x = xstart
            y = ystart
            state = states.idle
        }
        break;
    case states.walk:
        vsp = 0
        hsp = 0
        sprite_index = spr_pepgoblin
        if (targetplayer.x != x)
            image_xscale = sign((targetplayer.x - x))
        if (!((targetplayer.x > (x - 70) && targetplayer.x < (x + 70) && y <= (targetplayer.y + 29) && y >= (targetplayer.y - 29))))
        {
            dir = point_direction(x, y, targetplayer.x, targetplayer.y)
            x += lengthdir_x(3, dir)
            y += lengthdir_y(3, dir)
        }
        if hit
        {
            hit = 0
            state = states.turn
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
        hit = 1
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
scr_scareenemy()
if (bombreset > 0)
    bombreset--
targetplayer = (global.coop ? instance_nearest(x, y, obj_player) : obj_player1)
if (x != targetplayer.x && state == states.walk && state != states.Throw && obj_player.state != states.tumble && bombreset <= 0 && grounded)
{
    if (targetplayer.x > (x - 80) && targetplayer.x < (x + 80) && y <= (targetplayer.y + 30) && y >= (targetplayer.y - 30))
    {
        if (state == states.walk)
        {
            image_index = 0
            sprite_index = spr_pepgoblin_kick
            image_xscale = (-(sign((x - targetplayer.x))))
            state = states.Throw
        }
    }
}
if (grounded && state == states.Throw && floor(image_index) == 3)
    vsp = -5
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