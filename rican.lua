iphone = {}
--准备
iphone.zunbei = {color={{1575, 633, 0xd2ae7c}, {1560, 621, 0xfff2ce}, {1598, 637, 0xd18444}}}

--战斗中
iphone.zandouzon = {color={{1773, 634, 0x42326b},{1776, 508, 0x745d47},{1786, 568, 0xa2917d}}}

--胜利失败
iphone.senli1 = {color={{712, 219, 0xcebfab}, {715, 193, 0x7c1910}, {691, 229, 0x931b11}}}
iphone.senli2 = {color={{727, 720, 0x8eadda}, {727, 709, 0x94e7f8}, {717, 701, 0x3d84ca}}} --尽量下面点,爆东西多会遮住
              --{color={{817, 614, 0x3a82c9}, {799, 481, 0xdf901b}, {875, 617, 0x2d1814}}}  
iphone.sibai = {color={{695, 175, 0x4f4758}, {697, 203, 0xb9a790}, {677, 211, 0x595063}}}
iphone.zuduisibai = {color={{700, 113, 0x4f4758}, {678, 153, 0x5b5265}, {698, 140, 0xb7a58f}}}
iphone.zuduisenli = {color={{714, 127, 0x7c1910}, {693, 165, 0x941b11}, {705, 147, 0xccbda8}}}


iphone.scene_tinyuan = {color={{412, 688, 0x8a706d}, {510, 56, 0x775929}, {511, 44, 0x463132}, {572, 66, 0xfdda87}}}
iphone.scene_xiansi = {color={{371, 747, 0xde533a}, {356, 741, 0xfcb221}, {339, 714, 0x753d09}, {350, 710, 0x6d5342}}}
iphone.scene_diyuguiwan = {color={{168, 568, 0xd66869}, {197, 559, 0x5b4b44}, {146, 698, 0xd86a63}, {175, 416, 0xecd685}}}
iphone.scene_diyuzuiqian = {color={{212, 624, 0xe7ac1b}, {228, 605, 0xa6251d}, {379, 54, 0x701d0a}, {369, 67, 0xe7e1dc}}}
iphone.scene_landuxuanze = {color={{427, 243, 0x443332}, {426, 257, 0xedcea1}, {426, 270, 0x433231}, {554, 71, 0x82332e}}}
iphone.landuhuakuai = {color={{632, 340, 0x5e3b25}, {632, 316, 0xe3d349}, {632, 366, 0xa27f2b}, {618, 341, 0xa6812b}, {646, 341, 0x9e7a29}}, region={310, 298, 820, 384}}
require("TSLib")

Auto = require("auto")

--屏幕方向，0 - 竖屏，1 - Home 键在右边，2 - Home 键在左边
init(1)
Height,Width = getScreenSize();
if Width == 1792 then
    Btns = iphone
else
    Btns = pad
end

today = tonumber(os.date("%d", os.time()))

LAST_FEED = today-5
LAST_DIGUI = today-1
mydate = readFile(userPath().."/res/cs.txt") 
if mydate then 
    LAST_FEED = mydate[1]
    LAST_DIGUI = mydate[2]
    if LAST_FEED == nil then
        LAST_FEED = today-5
    end
    if LAST_DIGUI == nil then
        LAST_DIGUI = today-1
    end
else
    writeFile(userPath().."/res/cs.txt",{LAST_FEED, LAST_DIGUI},"w",1)
    toast(1213131)
end
toast("上次喂养"..LAST_FEED.." 上次地鬼"..LAST_DIGUI, 1)
mSleep(500)

function need_digui()
    if math.abs(LAST_DIGUI - today) == 0  then
        return false
    end
    return true
end

function need_feed()
    if math.abs(LAST_FEED - today) < 1 then
        return false
    end
    return true
end


fwShowWnd("msgwnd",Width-400, -1, Width, 20,0); 
function setText(text)
    local xx = text
    fwShowTextView("msgwnd","msg",text..xx,"left","EFD4CF","183F76",10,0,0,0,400,20,1,0)
    mSleep(100)
end

function battle() 
    if  Auto.is_colors(Btns.zunbei) then
        Auto.click_mask(Btns.zunbei,15)
        mSleep(200)
        return true
    elseif Auto.is_colors(Btns.senli1) or Auto.is_colors(Btns.zuduisenli) then
        setText("胜利一")
        local x = math.random(0,Width/10)
        local y = math.random(Height/5,Height/5*4)
        Auto.click(x, y, 15)
        mSleep(math.random(20,50))
        Auto.click(x, y, 15)
        return true
    --结算
    elseif Auto.is_colors(Btns.senli2) then
        setText("胜利二")
        local x = math.random(0,Width/10)
        local y = math.random(Height/5,Height/5*4)
        Auto.click(x, y, 15)
        return true
    elseif Auto.is_colors(Btns.sibai) or Auto.is_colors(Btns.zuduisibai) then
        setText("失败")
        mSleep(50)
        Auto.click(math.random(0,Width/10), math.random(Height/5,Height/5*4), 15)
        return true
    end
    return false
end

begin = 0
DIGUI_COUNT = 0
FEED_COUNT = 0
function diyuguiwan()
    if Auto.is_colors(Btns.scene_xiansi) then
        if DIGUI_COUNT == 2 then
            Auto.click(158,69)
        else
            Auto.click_mask(Btns.scene_xiansi)
        end
        mSleep(800)
        return true
    elseif Auto.is_colors(Btns.scene_diyuguiwan) then
        if DIGUI_COUNT == 2 then
            Auto.click(167,67)
        else
            Auto.click_mask(Btns.scene_diyuguiwan)
        end
        mSleep(1000)
        return true
    elseif Auto.is_colors(Btns.scene_diyuzuiqian) then
        if DIGUI_COUNT == 2 then --返回
            Auto.click(1488,78)
            mSleep(500)
        elseif DIGUI_COUNT == 0 then -- 点华北
            Auto.click(336,703)
            mSleep(1500)
        elseif DIGUI_COUNT == 1 then -- 点华中
            Auto.click(468,718)
            mSleep(1500)
        end
        
        --华北
        if multiColor({{617, 58, 0x3d1100}, {617, 70, 0x3d1100}, {616, 64, 0xf8f3e0}, {607, 60, 0x3f1101}, {603, 70, 0x421403}, {576, 61, 0x451402}, {564, 55, 0xf3edda}, {557, 62, 0xad9481}, {569, 75, 0xf7f1de}, {556, 77, 0xf8f3e0}}, 95) then 
            -- 涂壁,滑动下去打鸟
            if multiColor({{884, 247, 0xd5dbdf}, {884, 239, 0x78c149}, {878, 246, 0x80c948}, {888, 246, 0x6fb350}, {883, 252, 0x70b352}, {896, 309, 0xaa3354}}, 98) then
                Auto.swipe(457,620,458,133)
                mSleep(700)
                Auto.click(458,133)
                mSleep(700)
            end
            --是鸟->打
            if  multiColor({{876, 224, 0xf8f6f5}, {823, 223, 0x26b6d4}, {763, 201, 0xfbf9f8}, {816, 134, 0xd89125}}, 95) then
                while multiColor({{876, 224, 0xf8f6f5}, {823, 223, 0x26b6d4}, {763, 201, 0xfbf9f8}, {816, 134, 0xd89125}}, 95) do
                    Auto.click(1467,594)
                    mSleep(2000)
                end
            end
        end

        --华中
        if multiColor({{793, 162, 0xa24c43}, {840, 156, 0xf7e5d9}, {841, 275, 0xa93129}}, 95) then
            -- 书翁,滑动下去打真天
            if multiColor({{793, 162, 0xa24c43}, {840, 156, 0xf7e5d9}, {841, 275, 0xa93129}}, 95) then
                Auto.swipe(457,620,458,133)
                mSleep(300)
                Auto.swipe(457,420,458,103)
                mSleep(700)
                Auto.click(515,362)
                mSleep(700)
            end
            -- 是真天->打
            if multiColor({{796, 199, 0x8f5bbc}, {798, 213, 0xf4f4f2}, {814, 213, 0x905cbf}, {901, 248, 0xb29b80}}, 95) then
                while multiColor({{796, 199, 0x8f5bbc}, {798, 213, 0xf4f4f2}, {814, 213, 0x905cbf}, {901, 248, 0xb29b80}}, 95) do
                    Auto.click(1467,594)
                    mSleep(2000)
                end
            end
        end
        return true
    elseif Auto.is_colors(Btns.scene_landuxuanze) then
        
        -- 没有排名信息说明没打过，挑战
        if multiColor({{1179, 492, 0xc15609}, {1191, 492, 0x272420}, {1195, 495, 0xf8f3e0}, {1205, 512, 0x6a675e}, {1183, 506, 0xece7d5}}, 95) then
            -- 调整难度等级到1
            local x,y = Auto.find_colors(Btns.landuhuakuai,95,0)
            if x ~= -1 then
                Auto.swipe(x,y,40,y-20)
            end
            mSleep(500)
            Auto.click(1464,607)
            mSleep(300)
        else-- 有排名领奖,1,2,3
            mSleep(500)
            Auto.click(864,745)
            mSleep(800)
            Auto.click(864,745)
            mSleep(700)
            
            Auto.click(1037,745)
            mSleep(800)
            Auto.click(1037,745)
            mSleep(700)
            
            Auto.click(1271,745)
            mSleep(800)
            Auto.click(1271,745)
            mSleep(700)
            
            if os.time() - begin > 15 then
                begin = os.time()
                DIGUI_COUNT = DIGUI_COUNT + 1
            end
            -- 返回
            Auto.click(1488,78)
            mSleep(500)
        end
        return true
    end
    return false
end

function xiaodonwu()
    -- setText(" ".. os.time())
    if multiColor({{761, 72, 0xba5335}, {894, 18, 0xf1e6e3}, {1036, 69, 0xbe4820}, {149, 40, 0xd6c4a1}}, 95) then
        toast("宠物小屋")
        if multiColor({{1469, 729, 0xeee3d3}, {1126, 744, 0xa84f09}, {1239, 742, 0x8d716d}}, 95) == false then
            Auto.click(1602,761)
            mSleep(500)
        end
        --没有红点了说明喂好了
        if multiColor({{1652, 707, 0xfd0202}}, 95) == false then
            mydate = readFile(userPath().."/res/cs.txt") 
            mydate[1] = today
            LAST_FEED = today
            writeFile(userPath().."/res/cs.txt", mydate, "w", 1)
        end

    end
    if multiColor({{1294, 708, 0xfb0102}, {761, 70, 0xb1240a}, {1046, 25, 0x774d39}}, 95) then
        toast("1111")
        Auto.click(1237,745)
        mSleep(600)
    end
    if multiColor({{1174, 708, 0xfb0102}, {896, 19, 0xf1e6e3}, {745, 25, 0x764c38}}, 95) then
        toast("222")
        Auto.click(1123,739)
        mSleep(600)
    end
    if multiColor({{658, 163, 0x76553e}, {1131, 161, 0x674b37}, {690, 639, 0xdfd0c2}, {664, 654, 0x775843}}, 95) then
        Auto.click(1113,607)
        mSleep(800)
        Auto.click(1484,607)
        mSleep(800)
    end
end



while true do
    if multiColor({{1609, 709, 0x782327}, {1643, 659, 0xaa433e}, {1599, 729, 0xd9c7c2}, {1591, 742, 0xcba673}}, 95) then
        Auto.click(1609, 709) 
        mSleep(600)
    elseif Auto.is_colors(Btns.scene_tinyuan) then
        if DIGUI_COUNT == 0 and need_digui() then
            Auto.click_mask(Btns.scene_tinyuan)
        else
            -- 找小动物饿了
            toast("找小动物找小动物")
            local x,y = findMultiColorInRegionFuzzyByTable({{1385, 408, 0xff6e69}, {1380, 405, 0xf7d58d}, {1376, 399, 0xff6e69}, {1369, 404, 0xf9d798}, {1372, 438, 0xffcf48}},95,944,314,1786,543)
            if x~= -1 then
                Auto.click(x,y)
                mSleep(1000)
            end
        end
        if DIGUI_COUNT == 2 then
            DIGUI_COUNT = 3
            toast("地鬼打完咯",1)
            LAST_DIGUI = today
            mydate = readFile(userPath().."/res/cs.txt") 
            mydate[2] = LAST_DIGUI
            writeFile(userPath().."/res/cs.txt", mydate, "w", 1)
        end
        mSleep(800)
    elseif need_digui() and diyuguiwan() then
        mSleep(0)
    elseif need_feed() and xiaodonwu() then
        mSleep(0)
    elseif battle() then
        mSleep(400)
    elseif need_feed() == false and need_digui() == false then
        playAudio("ooo.mp3")
        mSleep(2000)
        lua_exit()
        mSleep(100)
    end
end