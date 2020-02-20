cur_time = reaper.GetPlayPosition()
index = reaper.AddProjectMarker2(0, false, cur_time, -1, "B", -1, reaper.ColorToNative(255, 0, 0)|16777216)

