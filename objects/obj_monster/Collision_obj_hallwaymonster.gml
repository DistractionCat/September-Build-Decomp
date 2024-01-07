if (state != (216 << 0) && state != (218 << 0) && state != (217 << 0) && (!hallway) && use_hallway && image_xscale == sign(other.image_xscale))
{
    var _destroy = 0
    with (obj_monstertrackingrooms)
    {
        var _monsterpos = monster_pos[other.monsterid]
        var _dir = other.image_xscale
        if self.grid_meeting((_monsterpos.x + _dir), _monsterpos.y)
        {
            _monsterpos.x += _dir
            monster_dir[other.monsterid].x = _dir
            _destroy = 1
            alarm[other.monsterid] = monster_alarm[other.monsterid]
        }
    }
    if _destroy
    {
        destroy = 0
        instance_destroy()
    }
}
