if ((!global.pizzadelivery) && global.pizzasdelivered < 5 && global.panic == 0)
{
    if (!global.failcutscene)
    {
        if (global.pizzasdelivered <= 0)
            scene_info = [[cutscene_set_sprite, 771, 2207, 0.35, -1], [cutscene_gustavo_start], [cutscene_wait, 30], [cutscene_set_sprite, 771, 2198, 0.35, -1], [cutscene_wait, 10], [cutscene_move_player, 246, (obj_gustavo.x - 48), 6, 16], [cutscene_set_sprite, 246, 2191, 0.35, 1], [cutscene_set_sprite, 771, 2199, 0.35, -1], [cutscene_gustavo_end]]
        else
            scene_info = [[cutscene_set_sprite, 771, 2198, 0.35, -1]]
    }
    else
        scene_info = [[cutscene_gustavofail_start], [cutscene_wait, 20], [cutscene_set_sprite, 771, 2202, 0.35, -1], [cutscene_waitfor_sprite, 771], [cutscene_set_sprite, 771, 2203, 0.35, -1], [cutscene_wait, 50], [cutscene_set_sprite, 771, 2204, 0.35, -1], [cutscene_set_sprite, 246, 2193, 0.35, 1], [cutscene_waitfor_sprite, 771], [cutscene_set_sprite, 771, 2205, 0.35, -1], [cutscene_set_hsp, 771, -12], [cutscene_set_sprite, 246, 2195, 0.35, 1], [cutscene_waitfor_sprite, 246], [cutscene_set_sprite, 246, 2196, 0.35, 1], [cutscene_check_collision, 771, 246], [cutscene_set_hsp, 771, 0], [cutscene_gustavofail_end, 100], [cutscene_move_actor, 771, obj_gustavo.xstart, obj_gustavo.ystart, 0.05], [cutscene_set_sprite, 771, 2198, 0.35, -1]]
}
else
    scene_info = [[cutscene_wait, 2]]
