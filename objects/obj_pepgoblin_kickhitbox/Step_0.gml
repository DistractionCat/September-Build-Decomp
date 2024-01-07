if instance_exists(baddieID)
{
    image_xscale = baddieID.image_xscale
    x = (baddieID.x + (baddieID.image_xscale * 50))
    y = baddieID.y
    if (baddieID.object_index == obj_pepbat)
    {
        x = (baddieID.x + (baddieID.image_xscale * 32))
        y = (baddieID.y + 40)
    }
}
