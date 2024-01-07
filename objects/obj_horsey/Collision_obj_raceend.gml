hsp = 0
vsp = 0
x = Approach(x, (other.x + (other.sprite_width / 2)), spd)
y = Approach(y, (other.y + (other.sprite_height / 2)), spd)
if (x == (other.x + (other.sprite_width / 2)) && y == (other.y + (other.sprite_height / 2)))
{
    spd = 0
    other.horseyfinish = 1
    global.horse = 0
}
