if (global.panic == 1 && global.fill > 0)
    global.fill -= 0.2
if (global.fill <= 0 && global.panic == 1 && (!instance_exists(obj_pizzaface)))
{
    instance_create(obj_player1.x, obj_player1.y, obj_pizzaface)
    scr_soundeffect(sfx_pizzaface)
}
floor((global.fill / 100))
global.fill = clamp(global.fill, 0, 4000)
