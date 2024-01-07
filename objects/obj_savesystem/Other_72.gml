var ident = ds_map_find_value(async_load, "id")
var status = ds_map_find_value(async_load, "status")
var error = ds_map_find_value(async_load, "error")
switch state
{
    case states.revolver:
        if (ident == saveid)
        {
            buffer_delete(savebuff)
            trace("Save status: ", status, ", error: ", error)
            state = states.normal
        }
        break;
    case states.dynamite:
        if (ident == loadid)
        {
            var buffstring = buffer_read(loadbuff, buffer_string)
            ini_open_from_string(buffstring)
            global.entrancecutscene = ini_read_real("cutscene", "entrance", 0)
            global.medievalcutscene = ini_read_real("cutscene", "medieval", 0)
            global.ruincutscene = ini_read_real("cutscene", "ruin", 0)
            global.dungeoncutscene = ini_read_real("cutscene", "dungeon", 0)
            global.desertcutscene = ini_read_real("cutscene", "desert", 0)
            global.graveyardcutscene = ini_read_real("cutscene", "graveyard", 0)
            global.farmcutscene = ini_read_real("cutscene", "farm", 0)
            global.spacecutscene = ini_read_real("cutscene", "space", 0)
            global.beachcutscene = ini_read_real("cutscene", "beach", 0)
            global.forestcutscene = ini_read_real("cutscene", "forest", 0)
            global.pinballcutscene = ini_read_real("cutscene", "pinball", 0)
            global.golfcutscene = ini_read_real("cutscene", "golf", 0)
            global.streetcutscene = ini_read_real("cutscene", "street", 0)
            global.sewercutscene = ini_read_real("cutscene", "sewer", 0)
            global.factorycutscene = ini_read_real("cutscene", "factory", 0)
            global.freezercutscene = ini_read_real("cutscene", "freezer", 0)
            global.chateaucutscene = ini_read_real("cutscene", "chateau", 0)
            global.mansioncutscene = ini_read_real("cutscene", "mansion", 0)
            global.kidspartycutscene = ini_read_real("cutscene", "kidsparty", 0)
            global.warcutscene = ini_read_real("cutscene", "war", 0)
            ini_str = ini_close()
            buffer_delete(loadbuff)
            trace("inistr: ", ini_str)
            trace("buffstring: ", buffstring)
            state = states.normal
        }
        break;
}

