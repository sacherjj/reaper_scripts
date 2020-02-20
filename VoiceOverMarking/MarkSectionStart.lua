cur_time = reaper.GetPlayPosition()
index = reaper.AddProjectMarker2(0, false, cur_time, -1, "S", -1, reaper.ColorToNative(0, 0, 255)|16777216)

