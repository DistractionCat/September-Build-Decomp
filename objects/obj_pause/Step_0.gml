/*
WARNING: Recursive script decompilation (for member variable name resolution) failed for room_goto_live

System.ArgumentOutOfRangeException: Index was out of range. Must be non-negative and less than the size of the collection. (Parameter 'index')
   at System.Collections.Generic.List`1.get_Item(Int32 index)
   at UndertaleModLib.Decompiler.DecompileFromBlock(DecompileContext context, Dictionary`2 blocks, Block block, List`1 tempvars, Stack`1 workQueue) in D:\a\UndertaleModToolCE\UndertaleModToolCE\UndertaleModLib\Decompiler\Decompiler.cs:line 2132
   at UndertaleModLib.Decompiler.DecompileFromBlock(DecompileContext context, Dictionary`2 blocks, Block block) in D:\a\UndertaleModToolCE\UndertaleModToolCE\UndertaleModLib\Decompiler\Decompiler.cs:line 2853
   at UndertaleModLib.Decompiler.<DecompileFromBlock>g__FindActualNameForAnonymousCodeObject|31_2(DecompileContext context, UndertaleCode anonymousCodeObject) in D:\a\UndertaleModToolCE\UndertaleModToolCE\UndertaleModLib\Decompiler\Decompiler.cs:line 2621
*/
/*
WARNING: Recursive script decompilation (for asset type resolution) failed for room_goto_live

System.ArgumentOutOfRangeException: Index was out of range. Must be non-negative and less than the size of the collection. (Parameter 'index')
   at System.Collections.Generic.List`1.get_Item(Int32 index)
   at UndertaleModLib.Decompiler.DecompileFromBlock(DecompileContext context, Dictionary`2 blocks, Block block, List`1 tempvars, Stack`1 workQueue) in D:\a\UndertaleModToolCE\UndertaleModToolCE\UndertaleModLib\Decompiler\Decompiler.cs:line 2132
   at UndertaleModLib.Decompiler.DecompileFromBlock(DecompileContext context, Dictionary`2 blocks, Block block) in D:\a\UndertaleModToolCE\UndertaleModToolCE\UndertaleModLib\Decompiler\Decompiler.cs:line 2853
   at UndertaleModLib.Decompiler.DirectFunctionCall.DoTypePropagation(DecompileContext context, AssetIDType suggestedType) in D:\a\UndertaleModToolCE\UndertaleModToolCE\UndertaleModLib\Decompiler\Decompiler.cs:line 1807
*/
if ((!pause) && obj_savesystem.state == states.normal && (!instance_exists(obj_fadeout)))
{
    if (obj_player1.key_start && room != rank_room && room != Realtitlescreen && room != timesuproom)
    {
        selected = 0
        if (!instance_exists(obj_pausefadeout))
            instance_create(x, y, obj_pausefadeout)
    }
}
if (instance_exists(obj_pausefadeout) && instance_exists(obj_fadeout))
    instance_destroy(obj_pausefadeout)
with (obj_player1)
{
    other.paletteselect = paletteselect
    other.spr_palette = spr_palette
}
if (pause && (!instance_exists(obj_option)))
{
    scr_getinput()
    application_surface_draw_enable(true)
    var prevselected = selected
    moveselect = ((-key_up2) + key_down2)
    selected += moveselect
    if (moveselect != 0 && selected >= 0 && selected <= 2)
        scr_soundeffect(sfx_step)
    selected = clamp(selected, 0, (array_length(pause_menu) - 1))
    if (prevselected != selected)
    {
        switch selected
        {
            case 0:
                peppino_sprite = spr_player_idle
                break;
            case 1:
                peppino_sprite = spr_file1
                break;
            case 2:
                peppino_sprite = spr_player_panic
                break;
            case 3:
                peppino_sprite = spr_player_winding
                break;
        }

        peppino_sprite_number = sprite_get_number(peppino_sprite)
        peppino_index = 0
    }
    if key_jump
    {
        switch selected
        {
            case 0:
                if (!instance_exists(obj_pausefadeout))
                    instance_create(x, y, obj_pausefadeout)
                break;
            case 2:
                var roomname = room_get_name(room)
                if (!global.snickchallenge)
                {
                    var rm = -4
                    var str_rm = string_letters(roomname)
                    switch string_letters(roomname)
                    {
                        case "entrance":
                        case "entrancec":
                        case "entrancesecret":
                            rm = entrance_1
                            break;
                        case "medieval":
                        case "medievalsecret":
                            rm = medieval_1
                            break;
                        case "chateau":
                        case "chateausecret":
                            rm = chateau_1
                            break;
                        case "ruin":
                        case "ruinsecret":
                            rm = ruin_1
                            break;
                        case "dungeon":
                        case "dungeonsecret":
                            rm = dungeon_1
                            break;
                        case "desert":
                        case "desertsecret":
                            rm = desert_1
                            break;
                        case "graveyard":
                        case "graveyardsecret":
                            rm = graveyard_1
                            break;
                        case "farm":
                        case "farmsecret":
                            rm = farm_1
                            break;
                        case "ufo":
                        case "ufosecret":
                            rm = ufo_1
                            break;
                        case "beach":
                        case "beachsecret":
                            rm = beach_1
                            break;
                        case "forest":
                        case "forestsecret":
                            rm = forest_1
                            break;
                        case "street":
                        case "streetintro":
                            rm = street_intro
                            break;
                        case "dragonlair":
                        case "dragonlairsecret":
                            rm = dragonlair_1
                            break;
                        case "strongcold":
                        case "strongcoldsecret":
                            rm = strongcold_10
                            break;
                        case "kidspartyentrance":
                        case "kidsparty":
                        case "kidspartysecret":
                            rm = kidsparty_entrance1
                            break;
                    }

                    if (rm == -4)
                        rm = asset_get_index((str_rm + "_1"))
                    if (rm == -1)
                        rm = asset_get_index((string_copy(str_rm, 1, (string_length(str_rm) - string_length("secret"))) + "_1"))
                    ds_list_clear(global.saveroom)
                    ds_list_clear(global.baddieroom)
                    if (rm != -4 && rm != -1)
                    {
                        instance_activate_all()
                        global.levelreset = 1
                        scr_room_goto(rm)
                        scr_playerreset()
                        pause = 0
                        obj_player1.targetDoor = "A"
                        if instance_exists(obj_player2)
                            obj_player2.targetDoor = "A"
                    }
                    else
                        scr_soundeffect(sfx_enemyprojectile)
                }
                break;
            case 1:
                scr_soundeffect(sfx_enemyprojectile)
                with (instance_create(x, y, obj_option))
                    depth = (other.depth - 1)
                break;
            case 3:
                if (room == hub_room1 || room == characterselect || room == cowboytask || room == Titlescreen || room == Scootertransition || room == rm_levelselect || string_copy(room_get_name(room), 1, 3) == "hub")
                {
                    pause = 0
                    instance_activate_all()
                    room = Realtitlescreen
                    with (obj_player1)
                    {
                        character = "P"
                        scr_characterspr()
                    }
                    scr_playerreset()
                    obj_player1.state = states.titlescreen
                    obj_player2.state = states.titlescreen
                    obj_player1.targetDoor = "A"
                    if instance_exists(obj_player2)
                        obj_player2.targetDoor = "A"
                    global.cowboyhat = 0
                    global.coop = 0
                }
                else
                {
                    pause = 0
                    instance_activate_all()
                    scr_playerreset()
                    global.levelreset = 1
                    obj_player1.targetDoor = "D"
                    if instance_exists(obj_player2)
                        obj_player2.targetDoor = "D"
                    room = hub_reception
                }
                break;
        }

    }
    cursor_index += 0.35
    if (cursor_index > cursor_sprite_number)
    {
        var p = (cursor_index - floor(cursor_index))
        cursor_index = p
    }
    peppino_index += 0.35
    if (peppino_index > peppino_sprite_number)
    {
        p = (peppino_index - floor(peppino_index))
        peppino_index = p
    }
    for (var i = 0; i < array_length(toppin_sprite); i++)
    {
        toppin_index[i] += 0.35
        if (toppin_index[i] > toppin_number[i])
        {
            var t = toppin_index[i]
            p = (t - floor(t))
            toppin_index[i] = p
        }
    }
    toppin_has[0] = global.cheesefollow
    toppin_has[1] = global.pineapplefollow
    toppin_has[2] = global.sausagefollow
    toppin_has[3] = global.shroomfollow
    toppin_has[4] = global.tomatofollow
}