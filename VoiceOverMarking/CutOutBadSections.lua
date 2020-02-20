
-- Item: Split items as time selection (40061)
-- Go to end of time selection (40631)


-- Set ripple editing per track (40310)
reaper.Main_OnCommand(40310, 0)
reaper.ShowConsoleMsg("")
markers = {}
index = 0
-- This will enumerate markers in time order.
while true do
  retval, isrgn, pos, rgnend, name, markrgnindexnumber = reaper.EnumProjectMarkers(index)

  if retval == 0 then
    break
  end

  num_str = string.sub(name, 0, -3)
  mark_type = string.sub(name, -1, -1) 
  --reaper.ShowConsoleMsg(num_str .. " " .. mark_type .. " " .. tostring(retval) .. " " .. tostring(pos) .. " " .. name .. "\n")
  
  if mark_type == "S" then
    region_start = pos
    cur_section = num_str
  elseif mark_type == "B" then
    if cur_section == num_str then
      --reaper.ShowConsoleMsg("Delete Marker index: " .. tostring(index) .. "\n")
      -- Adding 0.001 seconds to not delete the region start marker.
      reaper.GetSet_LoopTimeRange(true, false, region_start + 0.001, pos, false)
      -- Delete Bad Indicator marker
      reaper.DeleteProjectMarkerByIndex(0, index, false)
      -- Item: Split items as time selection (40061)
      reaper.Main_OnCommand(40061, 0)
      -- Time selection: Remove contents of time selection (moving later items) (40201)
      reaper.Main_OnCommand(40201, 0)
      --reaper.ShowConsoleMsg("Delete from " .. tostring(region_start) .. "-" .. tostring(pos) .. "\n")
      -- safest to reset to beginning and reprocess all
      index = 0
    else
      reaper.ShowConsoleMsg("Expecting section " .. cur_section .. ", but found bad tag for section " .. num_str .. ". Skipping. \n")
    end
  else
    reaper.ShowConsoleMsg("Unknown type " .. tostring(mark_type) .. "\n")
  end
  index = index + 1    
end

