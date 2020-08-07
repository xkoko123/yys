init(1)

require("TSLib")

Auto = require("auto")

--注销
function respring()
    os.execute("killall -9 SpringBoard");
end
respring()


-- while true do
--     local x,y=findMultiColorInRegionFuzzyByTable({{1071, 559, 0xfcdf99}},90,402,436,1433,718)
--     if x~=-1 then
--         Auto.showFinger(x,y,800)
--     end
--     toast(x.." "..y)
--     mSleep(800)
-- end
