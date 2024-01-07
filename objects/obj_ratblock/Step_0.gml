image_speed = 0.35
scr_ratblock_destroy()
if (sprite_index != spr_rattumbleblock && sprite_index != spr_rattumbleblock_big && sprite_index != spr_ratblock6)
    mask_index = spr_ratblock1
else
    mask_index = sprite_index
