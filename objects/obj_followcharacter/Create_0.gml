image_speed = 0.35
xoffset = 25
yoffset = 2
LAG_STEPS = 20
followqueue = ds_queue_create()
ds_list_add_unique(global.followerlist, id)
pos = ds_list_find_index(global.followerlist, id)
followid = (pos > 0 ? ds_list_find_value(global.followerlist, (pos - 1)) : -4)
instakilled = 0
dir = obj_player1.xscale
space = 0
maxspace = 1
spaceaccel = 0.2
