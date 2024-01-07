fake = 0
monsterid = 0
targetRoom = room
targetDoor = "A"
can_touch = 0
touched = 0
spr_dead = spr_monstershroom_dead
hallway = 0
destroy = 1
use_hallway = 0
depth = 7
investigatestate = 0
waitbuffer = 100
if variable_global_exists("monster_targetRoom")
{
    targetRoom = global.monster_targetRoom
    targetDoor = global.monster_targetDoor
}
alarm[0] = 30
if (distance_to_object(instance_nearest(x, y, obj_player)) < 100)
    alarm[0] = 80
if (room == exit_7)
    fake = 1
