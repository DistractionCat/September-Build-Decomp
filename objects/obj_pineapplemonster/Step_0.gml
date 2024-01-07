image_speed = 0.35
if (sprite_index != spr_monsterpineapple_idle && floor(image_index) == (image_number - 1))
    sprite_index = spr_monsterpineapple_idle
x = lerp(x, (obj_player1.x - (100 * obj_player1.xscale)), 0.05)
y = lerp(y, (obj_player1.y - 100), 0.05)
if (x != obj_player1.x)
    image_xscale = (-(sign((x - obj_player1.x))))
