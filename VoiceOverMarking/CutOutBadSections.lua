
-- Set ripple editing per track (40310)
reaper.Main_OnCommand(40310, 0)
index = 0
-- This will enumerate markers in time order.
while true do
  retval, isrgn, pos, rgnend, mark_type, markrgnindexnumber = reaper.EnumProjectMarkers(index)

  if retval == 0 then
    break
  end

  if mark_type == "S" then
    region_start = pos
  elseif mark_type == "B" then
    -- Adding 0.001 seconds to not delete the region start marker.
    reaper.GetSet_LoopTimeRange(true, false, region_start + 0.001, pos, false)
    -- Delete Bad Indicator marker
    reaper.DeleteProjectMarkerByIndex(0, index, false)
    -- Item: Split items as time selection (40061)
    reaper.Main_OnCommand(40061, 0)
    -- Time selection: Remove contents of time selection (moving later items) (40201)
    reaper.Main_OnCommand(40201, 0)
    -- reset to beginning and reprocess to find another bad region
    index = 0
  else
    reaper.ShowConsoleMsg("Unknown type " .. tostring(mark_type) .. "\n")
  end
  index = index + 1    
end

