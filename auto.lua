require("TSLib")
AUTO = {}

Height,Width = getScreenSize();

--越大越慢
function AUTO.swipe(x1, y1, x2, y2, per_sleep)
    if per_sleep == nil then
        per_sleep = 8
    end

    local i_count = math.ceil(math.max(math.abs(x1-x2),math.abs(y1-y2))/18)
    
    local x_dlt = math.abs(x1-x2) / i_count
    local y_dlt = math.abs(y1-y2) / i_count
    
    touchDown(x1, y1)
    mSleep(30)
    for i=1,i_count,1 do
        if x1>x2 then
            x1 = x1 - x_dlt
        else
            x1 = x1 + x_dlt
        end
        if y1>y2 then
            y1 = y1 - y_dlt
        else
            y1 = y1 + y_dlt
        end

        touchMove(x1,y1)
        mSleep(per_sleep)
    end
    touchUp(x2 + math.random(-5,5), y2 + math.random(-5,5))
    mSleep(8)
end

function AUTO.swipe_left()
    AUTO.swipe(Width - Width/10, math.random(Height/5,Height-Height/5), Width/10, math.random(Height/5,Height-Height/5))
    mSleep(500)
end

function AUTO.showFinger(x,y,time)
    if time == nil then
        time = 300
    end
    fwShowWnd("finger",x-25,y-25,x+25,y+25,1);
    --按钮视图是以浮动窗口载体的（300,300）点坐标为（0,0）点坐标显示的
    fwShowTextView("finger","textid","●","center","45B97C","",25,1,0,0,40,40,1);
    mSleep(time)
    fwCloseWnd("finger")
end

function AUTO.click(x, y, r)
    if r == nil then
        r = 5
    end
    -- randomsTap(x, y, r, "click.png", 1)

    local down_x = x + math.random(-r,r)
    local down_y = y + math.random(-r,r)
    local up_x = down_x + math.random(-5,5)
    local up_y = down_y + math.random(-5,5)

    AUTO.showFinger(down_x,down_y,200)
    
    touchDown(down_x, down_y)
    mSleep(30)
    touchMove(up_x,up_y)
    touchUp(up_x, up_y)
    mSleep(30)
end

function AUTO.click_mask(data, r)
    if r == nil then
        r = 5
    end
    local c = data.color[1]
    local x, y = c[1], c[2]
    AUTO.click(x, y, r)
end


--------------------------------------找色---------------------------------------
--------------------------------------找色---------------------------------------
--------------------------------------找色---------------------------------------
--数据结构data={color={{250,198,0x58d20e},{250,198,0x58d20e}}, region={1,2,3,4}}
-- region可空,color可1个可几个

-- 找多个颜色
function AUTO.is_colors(data, threshold)
    if threshold == nil then
        threshold = 90
    end

    return multiColor(data.color, threshold, true)
end

-- 找多个颜色并点击第一个
function AUTO.is_colors_tap(data, threshold, r)
    if threshold == nil then
        threshold = 90
    end
    if r == nil then
        r = 5
    end

    -- local color = data.color
    -- color[1], color[#color] = color[#color], color[1]
    if Auto.is_colors(data, threshold) then
        Auto.click_mask(data, r)
        return true
    else
        return false
    end
end

-- 找相对坐标颜色,返回第一个点坐标
function AUTO.find_colors(data, threshold, miss, region)
    local t = {}
    local x1, y1, x2, y2 = 0, 0, 5000, 5000
    if region ~= nil then
        x1, y1, x2, y2 = region[1],region[2],region[3],region[4]
    elseif data.region ~= nil then
        x1, y1, x2, y2 = data.region[1], data.region[2], data.region[3], data.region[4]
    end

    if miss == nil then
        t.max_miss=miss
    end

    -- local c,p = toStringType(data.color)
    -- toast(string.format("%d %s",c, p) )
    -- mSleep(600)
    
    -- return findMultiColorInRegionFuzzy(c,p,threshold,x1,y1,x2,y2,t)
    return findMultiColorInRegionFuzzyByTable(data.color, threshold, x1, y1, x2, y2, t)
    -- return findMultiColorInRegionFuzzyByTable(data.color, 90)
end

-- 找图上所有匹配的相对颜色
function AUTO.find_colors_all(data, threshold, _count, margin, region)
    local c,p = toStringType(data.color)
    local x1, y1, x2, y2 = 0, 0, 5000, 5000
    if region ~= nil then
        x1, y1, x2, y2 = region[1],region[2],region[3],region[4]
    elseif data.region ~= nil then
        x1, y1, x2, y2 = data.region[1], data.region[2], data.region[3], data.region[4]
    end
    -- c,p = 0xfff002,"-2|-15|0xffae15,-7|-18|0xffa219,-18|-12|0xf4b411,-17|-2|0xfee804"
    local t = findMultiColorInRegionFuzzyExt(c, p, threshold ,x1, y1, x2, y2, {count=_count})
    local last_x, last_y = -999, -999
    local temp_table = {}
    for i,v in ipairs(t) do
        local x,y = v.x, v.y
        if math.abs(last_x - x) > margin or math.abs(last_y - y) > margin then
            table.insert(temp_table,{x,y})
        end
        last_x, last_y = x, y
    end
    return temp_table
end

return AUTO