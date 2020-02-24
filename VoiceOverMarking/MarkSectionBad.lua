if reaper.GetPlayState() == 0 then
  cur_pos = reaper.GetCursorPosition()
else
  cur_pos = reaper.GetPlayPosition()
end
reaper.AddProjectMarker2(0, false, cur_pos, -1, "B", -1, reaper.ColorToNative(255, 0, 0)|16777216)

