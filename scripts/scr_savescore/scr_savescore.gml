function scr_savescore(argument0) //scr_savescore
{
    if ((global.collect + global.collectN) >= global.srank)
    {
        global.rank = "s"
        if (global.snickchallenge == 1)
            global.SAGEsnicksrank = 1
    }
    else if ((global.collect + global.collectN) > global.arank)
        global.rank = "a"
    else if ((global.collect + global.collectN) > global.brank)
        global.rank = "b"
    else if ((global.collect + global.collectN) > global.crank)
        global.rank = "c"
    else
        global.rank = "d"
    if (global.rank == "s")
        scr_soundeffect(mu_ranks)
    if (global.rank == "a")
        scr_soundeffect(mu_ranka)
    if (global.rank == "b")
        scr_soundeffect(mu_rankc)
    if (global.rank == "c")
        scr_soundeffect(mu_rankc)
    if (global.rank == "d")
        scr_soundeffect(mu_rankd)
    audio_stop_sound(mu_pizzatime)
    audio_stop_sound(mu_noiseescape)
    audio_stop_sound(mu_dragonlair)
    audio_stop_sound(mu_snickchallenge)
    audio_stop_sound(mu_snickchallengeend)
    ini_open_from_string(obj_savesystem.ini_str)
    if (ini_read_real("Highscore", argument0, 0) < global.collect)
        ini_write_real("Highscore", argument0, global.collect)
    if (ini_read_real("Treasure", argument0, 0) == 0)
        ini_write_real("Treasure", argument0, global.treasure)
    if (ini_read_real("Secret", argument0, 0) < global.secretfound)
        ini_write_string("Secret", argument0, global.secretfound)
    if (ini_read_real("Toppin", (argument0 + "1"), 0) == 0)
        ini_write_real("Toppin", (argument0 + "1"), global.shroomfollow)
    if (ini_read_real("Toppin", (argument0 + "2"), 0) == 0)
        ini_write_real("Toppin", (argument0 + "2"), global.cheesefollow)
    if (ini_read_real("Toppin", (argument0 + "3"), 0) == 0)
        ini_write_real("Toppin", (argument0 + "3"), global.tomatofollow)
    if (ini_read_real("Toppin", (argument0 + "4"), 0) == 0)
        ini_write_real("Toppin", (argument0 + "4"), global.sausagefollow)
    if (ini_read_real("Toppin", (argument0 + "5"), 0) == 0)
        ini_write_real("Toppin", (argument0 + "5"), global.pineapplefollow)
    if (global.rank == "s")
        ini_write_string("Ranks", argument0, global.rank)
    if (global.rank == "a" && "s" != ini_read_string("Ranks", argument0, "none"))
        ini_write_string("Ranks", argument0, global.rank)
    if (global.rank == "b" && "s" != ini_read_string("Ranks", argument0, "none") && "a" != ini_read_string("Ranks", argument0, "none"))
        ini_write_string("Ranks", argument0, global.rank)
    if (global.rank == "c" && "s" != ini_read_string("Ranks", argument0, "none") && "a" != ini_read_string("Ranks", argument0, "none") && "b" != ini_read_string("Ranks", argument0, "none"))
        ini_write_string("Ranks", argument0, global.rank)
    if (global.rank == "d" && "s" != ini_read_string("Ranks", argument0, "none") && "a" != ini_read_string("Ranks", argument0, "none") && "b" != ini_read_string("Ranks", argument0, "none") && "c" != ini_read_string("Ranks", argument0, "none"))
        ini_write_string("Ranks", argument0, global.rank)
    obj_savesystem.ini_str = ini_close()
}

