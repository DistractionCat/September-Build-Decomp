depth = -999
function get_player_hp() //get_player_hp_gml_Object_obj_bosscontroller_Create_0
{
}

player_hpmultiplier = 300
player_hpbase = (player_hpmultiplier * 5)
player_hpmax = player_hpbase
player_hp = player_hpmax
level_array[0] = "entrance"
level_array[1] = "medieval"
level_array[2] = "ruin"
level_array[3] = "dungeon"
toppin_count[0] = array_create(5, 0)
toppin_count[1] = array_create(5, 0)
toppin_count[2] = array_create(5, 0)
toppin_count[3] = array_create(5, 0)
toppin_count[4] = array_create(5, 0)
maxminutes = 0
maxseconds = 45
round_count = 1
round_max = 6
timer_max = (room_speed * 3)
timer_buffer = timer_max
minutes = maxminutes
seconds = maxseconds
use_countdown = 1
bossID = -4
state = states.arenaintro
fade = 1
fakedeath = 0
extrarounds = 0
extrarounds_count = 3
startroundfunc = -4
endroundfunc = -4
intro_buffer = 300
playerx = -415
bossx = room_width
vsy = -400
flamey = 0
flash = 0
flashed = 0
vstitle = spr_vstitle
playerspr = spr_vspeppino
playersprshadow = 1410
bossspr = spr_vsnoise
bosssprshadow = 1408
