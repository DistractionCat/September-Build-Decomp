direction = angle_rotate(direction, point_direction(x, y, player.x, player.y), 2)
count++
if (count % 30)
    create_particle(x, y, (1 << 0), 0)
