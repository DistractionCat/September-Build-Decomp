image_xscale = playerid.xscale
if (playerid.state != states.rocket && playerid.state != states.mach3 && playerid.state != states.crouchslide && playerid.state != states.shoulderbash)
    instance_destroy()
x = (playerid.x + ((playerid.character == "M" ? 18 : 0) * playerid.xscale))
y = (playerid.y - (playerid.character == "M" ? 10 : 0))
visible = (!(room == rank_room))
