if (parryable && other.state == states.backbreaker && other.parry_inst != -4)
    return;
player_hurt(dmg, other.id)
