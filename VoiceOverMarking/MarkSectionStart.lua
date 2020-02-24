if reaper.GetPlayState() == 0 then
  cur_pos = reaper.GetCursorPosition()
else
  cur_pos = reaper.GetPlayPosition()
end
reaper.AddProjectMarker2(0, false, cur_pos, -1, "S", -1, reaper.ColorToNative(0, 0, 255)|16777216)
