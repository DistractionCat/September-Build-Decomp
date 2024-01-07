if (state != states.gameover)
    draw_sprite(spr_canoncrosshair, (state == states.normal ? 0 : -1), crosshair_x, crosshair_y)
