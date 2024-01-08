function scr_player_freefallland() //scr_player_freefallland
{
    mach2 = 0
    jumpAnim = 1
    dashAnim = 1
    landAnim = 0
    moveAnim = 1
    stopAnim = 1
    crouchslideAnim = 1
    crouchAnim = 0
    machhitAnim = 0
    movespeed = 0
    facehurt = 1
    start_running = 1
    alarm[4] = 14
    vsp = 0
    hsp = 0
	if (key_jump2 && sprite_index != spr_machfreefall)
    {
		vsp = -16
	    state = states.jump
        sprite_index = spr_player_groundpoundjump
    }
    if (floor(image_index) == (image_number - 1) && sprite_index != spr_player_groundpoundjump)
    {
        state = states.jump
		vsp = -8
        jumpstop = 1
        sprite_index = spr_machfreefall
    }
    image_speed = 0.35
}

