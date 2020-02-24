pause = 2
play = 1
record = 4

play_state = reaper.GetPlayState()
if play_state == 0 then
  cur_pos = reaper.GetCursorPosition()
else
  cur_pos = reaper.GetPlayPosition()
end
reaper.ShowConsoleMsg(tostring(play_state) .. " " .. tostring(cur_pos) .. " " .. tostring(play_pos) .. "\n")
reaper.AddProjectMarker2(0, false, cur_pos, -1, "B", -1, reaper.ColorToNative(255, 0, 0)|16777216)

