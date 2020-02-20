
cur_time = reaper.GetPlayPosition()
markeridx, _ = reaper.GetLastMarkerAndCurRegion(0, cur_time)
num = 0

if markeridx > -1 then
  _, _, _, _, name, _ = reaper.EnumProjectMarkers(markeridx)
  num = tonumber(string.sub(name, 0, -3))
end
mark_name = tostring(num + 1) .. "-S"
index = reaper.AddProjectMarker2(0, false, cur_time, -1, mark_name, -1, reaper.ColorToNative(0, 0, 255)|16777216)

