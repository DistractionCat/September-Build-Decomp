function scr_player_ratmountspit() //scr_player_ratmountspit
{
    hsp = 0
    vsp = 0
    with (ratgrabbedID)
        scr_enemy_ratgrabbed()
    if (floor(image_index) == (image_number - 1))
    {
        state = states.ratmount
        ratgrabbedID = -4
    }
}

