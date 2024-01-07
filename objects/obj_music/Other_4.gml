if ((!global.panic) && global.combo < 50 && (!global.snickchallenge) && (!instance_exists(obj_hungrypillar)))
{
    if instance_exists(obj_pepperman)
    {
        audio_stop_all()
        scr_sound(mu_chase)
    }
    roomname = room_get_name(room)
    global.mu = -4
    var trackposition = 1
    switch string_letters(roomname)
    {
        case "rmlevelselect":
            global.mu = -4
            trackposition = 0
            break;
        case "characterselect":
            global.mu = mu_characterselect
            trackposition = 0
            break;
        case "Realtitlescreen":
            global.mu = mu_title
            trackposition = 0
            break;
        case "hubroom":
        case "Titlescreen":
        case "halloweenentrance":
            global.mu = mu_hub
            trackposition = 0
            break;
        case "PProom":
            global.mu = mu_tutorial
            trackposition = 0
            break;
        case "entrance":
            global.mu = (obj_player1.character == "P" ? mu_entrance : mu_noiseentrance)
            break;
        case "dungeon":
            for (var i = 0; i < 20; i++)
            {
                if (roomname == ("dungeon_" + string(i)) && i <= 8)
                    global.mu = mu_dungeon
                else if (roomname == ("dungeon_" + string(i)) && i > 8)
                    global.mu = mu_dungeondepth
            }
            break;
        case "strongcold":
            if (roomname == "strongcold_1")
                global.mu = mu_chateau
            else
            {
                for (i = 0; i < 20; i++)
                {
                    if (roomname == ("strongcold_" + string(i)) && i <= 8 && i > 1)
                        global.mu = mu_strongcold
                    else if (roomname == ("strongcold_" + string(i)) && i > 8)
                        global.mu = mu_dungeondepth
                }
            }
            break;
        case "medieval":
            for (i = 0; i < 20; i++)
            {
                if (roomname == ("medieval_" + string(i)) && i <= 2)
                    global.mu = mu_medievalentrance
                else if (roomname == ("medieval_" + string(i)) && i > 2 && i <= 5)
                    global.mu = mu_medievalremix
                else if (roomname == ("medieval_" + string(i)) && i > 5)
                    global.mu = mu_medieval
            }
            break;
        case "ruin":
            for (i = 0; i < 20; i++)
            {
                if (roomname == ("ruin_" + string(i)) && i <= 6)
                    global.mu = mu_ruin
                else if (roomname == ("ruin_" + string(i)) && i > 6)
                    global.mu = mu_ruinremix
            }
            break;
        case "floorroom":
            for (i = 0; i < 20; i++)
            {
                if (roomname == ("desert_" + string(i)) && i <= 9)
                    global.mu = mu_desert
                else if (roomname == ("desert_" + string(i)) && i > 9)
                    global.mu = mu_ufo
            }
            break;
        case "forest":
            if (roomname == "forest_4" || roomname == "forest_4b")
                global.mu = mu_gustavo
            else
                global.mu = mu_forest
            break;
        case "chateau":
            global.mu = mu_chateau
            break;
        case "farm":
            global.mu = mu_farm
            break;
        case "graveyard":
            global.mu = mu_graveyard
            break;
        case "ufo":
            global.mu = mu_pinball
            break;
        case "beach":
            global.mu = mu_beach
            break;
        case "entrancesecret":
        case "chateausecret":
        case "strongcoldsecret":
        case "medievalsecret":
            global.mu = mu_medievalsecret
            break;
        case "ruinsecret":
            global.mu = mu_ruinsecret
            break;
        case "dungeonsecret":
            global.mu = mu_dungeonsecret
            break;
        case "dragonlair":
            global.mu = mu_dragonlair
            break;
        case "floorsecret":
            global.mu = mu_desertsecret
            break;
        case "ufosecret":
            global.mu = mu_pinballsecret
            break;
        case "graveyardsecret":
            global.mu = mu_graveyardsecret
            break;
        case "farmsecret":
            global.mu = mu_farmsecret
            break;
    }

    if (global.mu != -4 && (!audio_is_playing(global.mu)))
    {
        audio_stop_all()
        scr_sound(global.mu)
        pausedmusic = global.mu
        if trackposition
            audio_sound_set_track_position(global.music, fadeoff)
    }
    else if (global.mu == -4)
    {
        if (room == rm_levelselect)
            audio_stop_all()
    }
}
if (room == custom_lvl_room)
    alarm[0] = 4
