--屏幕方向，0 - 竖屏，1 - Home 键在右边，2 - Home 键在左边
init(1)

require("TSLib")
Auto = require("auto")
Views = require("views")

--记录上一次战斗结束的时间
LAST_BATTLE_TIME = os.time() - 10
SIBAI_COUNT = 0
--当前打了几次了
SENLI_COUNT = 0
MANJI_COUNT = 2
RANDOM_CLICK = false

-- 需要点击准备
CLICK_ZUNBEI = true

-- 困28队长走了自动退出
K28TUICU = false

-- 自动认输
RENSU = false

--个人结界认输保级 最后一个结界输4次
BAOJI = false
RENSU_COUNT = 0

ZIDONG_BIAO_GUAI = false


t = readFile(userPath().."/res/test.txt")
if t ~= false and #t ~= 0 then
    BIAOGUAI_X, BIAOGUAI_Y = t[1], t[2]
    log(string.format("读取标记 %d %d",BIAOGUAI_X, BIAOGUAI_Y),"阴阳师")
else
    log("没有读取到标记 -1","阴阳师")
    BIAOGUAI_X = -1
    BIAOGUAI_Y = -1
end


fwShowWnd("msgwnd",Width-400, -1, Width, 20,0); 
function setText(text)
    local xx = string.format(" 胜:%d 负:%d",SENLI_COUNT, SIBAI_COUNT)
    fwShowTextView("msgwnd","msg",text..xx,"left","EFD4CF","183F76",10,0,0,0,400,20,1,0)
    mSleep(100)
end


-- 返回true表示已经手工点准备了
function manji_jianca()
    keepScreen(false)
    --检查满级个数
    local count = Auto.find_colors_all(Views.manji,95,50,100)

    count = #count
    setText(string.format("准备: 满级%d个",count))

    if count >= MANJI_COUNT then
        playAudio("manji.mp3")
        log(string.format("满级%d个",count),"阴阳师")
        for i=0,17,1 do
            toast(string.format("满级满级%d个 换狗粮倒计时%d",count, 17-i),1)
            vibrator()
            mSleep(1000)
            if Auto.is_colors(Views.zandouzon) then
                playAudio("")
                return true
            end
        end
        playAudio("")
    end
    return false
end

function battle() 
    if Auto.is_colors(Views.zandouzon) then
        keepScreen(false)
        log("战斗中","阴阳师")
        local begin = os.time()
        
        while Auto.is_colors(Views.zandouzon) do
            if RANDOM_CLICK and math.random()<0.01 then
                Auto.swipe(math.random(Width/6, Width/6*5), math.random(Height/4, Height/4*3), math.random(Width/6, Width/6*5), math.random(Height/4, Height/4*3))
                if math.random()<0.02 then
                    mSleep(150)
                    Auto.swipe(math.random(Width/6, Width/6*5), math.random(Height/4, Height/4*3), math.random(Width/6, Width/6*5), math.random(Height/4, Height/4*3))
                end
            end

            setText(string.format("%02d战斗中",os.time() - begin))
            
            if Auto.is_colors(Views.message, 90) or Auto.is_colors(Views.messagepop,95) then
                playAudio("ooo.wav")
                vibrator()
                mSleep(1200)
            end
            mSleep(300)
        end

        return true
    elseif CLICK_ZUNBEI == true and Auto.is_colors(Views.zunbei) then
        log("准备","阴阳师")
        --检查满级
        if MANJI_COUNT ~= 99 then
            mSleep(350)
            if manji_jianca() then
                LAST_BATTLE_TIME = os.time()
                return true
            end
        else
            setText("准备")
        end
        
        if RENSU == true or RENSU_COUNT > 0 then
            RENSU_COUNT = RENSU_COUNT - 1
            toast(string.format("认输咯,还要认输%d次", RENSU_COUNT),1)
            while Auto.is_colors(Views.zunbei) or Auto.is_colors(Views.zandouzon) do
                Auto.click_mask(Views.rensu)
                mSleep(700)
            end
            while Auto.is_colors(Views.rensuqueren) do
                Auto.click_mask(Views.rensuqueren)
                mSleep(500)
            end
            return true
        end


        Auto.click_mask(Views.zunbei,15)
        mSleep(200)
        LAST_BATTLE_TIME = os.time()
        
        if ZIDONG_BIAO_GUAI == true then
            if BIAOGUAI_X == -1 then
                dialog("点击标怪位置", 0);
                mSleep(500);
                BIAOGUAI_Y, BIAOGUAI_X = catchTouchPoint();
                BIAOGUAI_Y = Height - BIAOGUAI_Y
                writeFile(userPath().."/res/test.txt",{BIAOGUAI_X, BIAOGUAI_Y},"w",1)
                log(string.format("获取保存点击标记坐标%d %d",BIAOGUAI_X, BIAOGUAI_Y),"阴阳师")
                toast(string.format("获取保存点击标记坐标%d %d",BIAOGUAI_X, BIAOGUAI_Y),1.5)
                mSleep(500)
            else
                mSleep(800)
                Auto.click(BIAOGUAI_X, BIAOGUAI_Y, 5)
                toast(string.format("点击标记%d %d",BIAOGUAI_X, BIAOGUAI_Y),1)
                -- mSleep(500)
            end
        end
        return true
    elseif Auto.is_colors(Views.senli1) or Auto.is_colors(Views.zuduisenli) or Auto.is_colors(Views.zandousenlirighttop) then
        setText("胜利一")
        if math.random() > 0.5 then
            local x = math.random(0,Width/10)
            local y = math.random(Height/5,Height/5*4)
            Auto.click(x, y, 15)
            mSleep(math.random(20,50))
            Auto.click(x, y, 15)
        else
            local x = math.random(Width/10*9,Width)
            local y = math.random(Height/5,Height)
            Auto.click(x, y, 15)
            mSleep(math.random(20,50))
            Auto.click(x, y, 15)
        end
        log("#########胜利","阴阳师")
        if os.time() - LAST_BATTLE_TIME > 4 then
            LAST_BATTLE_TIME = os.time()
            SENLI_COUNT = SENLI_COUNT + 1
            setText("失败")
            mSleep(30)
        end
        return true
    --结算
    elseif Auto.is_colors(Views.senli2) or Auto.is_colors(Views.zandousenlirightbottom) then
        setText("胜利二")
        if math.random() > 0.5 then
            local x = math.random(0,Width/10)
            local y = math.random(Height/5,Height/5*4)
            Auto.click(x, y, 15)
        else
            local x = math.random(Width/10*9,Width)
            local y = math.random(Height/5,Height)
            Auto.click(x, y, 15)
        end
        if os.time() - LAST_BATTLE_TIME > 4 then
            LAST_BATTLE_TIME = os.time()
            SENLI_COUNT = SENLI_COUNT + 1
        end
        mSleep(300)
        return true

    elseif Auto.is_colors(Views.sibai) or Auto.is_colors(Views.zuduisibai) then
        setText("失败")
        mSleep(50)
        if math.random() > 0.5 then
            Auto.click(math.random(0,Width/10), math.random(Height/5,Height/5*4), 15)
        else
            Auto.click(math.random(Width/10*9,Width), math.random(Height/5,Height/5*4), 15)
        end

        log("#########失败","阴阳师")

        if os.time() - LAST_BATTLE_TIME > 4 then
            LAST_BATTLE_TIME = os.time()
            
            SIBAI_COUNT = SIBAI_COUNT + 1
            for i = 1, 28, 1 do
                vibrator()
                mSleep(40)
            end
        end
        return true
    end
    return false
end

function yaoqin()
    if Auto.is_colors(Views.jiesouyaoqinmoren) or Auto.is_colors(Views.jiesouyaoqinmoren2) then
        setText("有人邀请咯 默认")
        Auto.is_colors_tap(Views.jiesouyaoqinmoren, 25)
        -- Auto.is_colors_tap(Views.jiesouyaoqinmoren2, 25)
        return true
    elseif Auto.is_colors(Views.jiesouyaoqin) or Auto.is_colors(Views.jiesouyaoqin2) then
        setText("有人邀请咯")
        Auto.is_colors_tap(Views.jiesouyaoqin, 25)
        -- Auto.is_colors_tap(Views.jiesouyaoqin2, 25)
        return true
    elseif Auto.is_colors(Views.xiezanduiwujiemian,99) then
        keepScreen(false)
        setText("协战队伍界面")
        begin = os.time()
        log("协战队伍 等人","阴阳师")
        while Auto.is_colors(Views.xiezanduiwujiemian) do    
            if os.time() - begin > 6 then
                toast(string.format("%02d人呢",os.time() - begin)) 
                vibrator()
                mSleep(800)
            else
                toast(string.format("%02d等人等人？",os.time() - begin))
                mSleep(800)
            end
        end
        return true
    end
    return false
end

function yinyanzai()
    if Auto.is_colors(Views.zaijiejie) == true then
        setText("寨结界界面")
        keepScreen(false)
        RENSU_COUNT = 0
        local fankuai_x, fankuai_y = Auto.find_colors(Views.zaijiejie_fankuan,96)
        if fankuai_x ~= -1 then
            Auto.click(fankuai_x,fankuai_y,15)
            mSleep(500)
            for i=0,4,1 do
                local x,y = Auto.find_colors(Views.zaijiejiejingon_hui,95,0)
                if x ~= -1 then
                    for i = 1, 10, 1 do
                        toast("没次数咯没次数咯",0.5)
                        vibrator()
                        mSleep(500)
                    end
                    finish()
                    return true
                end
                x, y = Auto.find_colors(Views.zaijiejiejinggong,90,0)
                if x ~= -1 then
                    nLog("找到结界进攻按钮"..i)
                    Auto.click(x,y,10)
                    mSleep(200)
                    x, y = Auto.find_colors(Views.zaijiejiejinggong,90,0)
                    if x ~= -1 then
                        Auto.click(fankuai_x,fankuai_y,15)
                    end
                    mSleep(800)
                    return true
                end
                mSleep(200)
            end
        end
        return true
    elseif Auto.is_colors(Views.gerenjiejie) == true then
        keepScreen(false)
        setText("个人结界界面")
        if BAOJI == true then
            if Auto.is_colors(Views.gerenjiejiesuzi8) then
                mSleep(1000)
                local xx,yy = Auto.find_colors(Views.jiejiesibaiarrow,95)
                if xx == -1 then
                    RENSU_COUNT = 4
                    toast(string.format("最后一个认输4次"))
                end
            end
        end
        local fankuai_x, fankuai_y = Auto.find_colors(Views.gerenjiejiefankuai,95)
        if fankuai_x ~= -1 then
            nLog("找到方块块")
            Auto.click(fankuai_x,fankuai_y,15)
            mSleep(500)
            for i=0,4,1 do
                x, y = Auto.find_colors(Views.gerenjiejiejinggong,90,0)
                if x ~= -1 then
                    nLog("找到结界进攻按钮"..i)
                    Auto.click(x,y,10)
                    mSleep(200)
                    x,y = Auto.find_colors(Views.gerenjiejiejinggong,90,0)
                    if x ~= -1 then
                        Auto.click(fankuai_x,fankuai_y,15)
                    end
                    mSleep(800)
                    return true
                end
                mSleep(200)
            end
            
            return true
        end
    end
    return false

end

--困28 自动退队
function zidonfanhui28()
    -- duizan_tubiao = {color={{126, 164, 0x5f3e1f},{126, 138, 0xf6f1b5},{138, 152, 0x4e3014}}}
    duizan_tubiao = {color={{154, 531, 0xf9faf1}, {152, 507, 0xb12d37}}}
    if Auto.is_colors(Views.tansuolei,90) == false then
        return false
    end
    if Auto.is_colors(duizan_tubiao, 90) == false then
        setText("队长跑啦")
        if math.random()<0.1 then
            mSleep(500)
        end
        Auto.click_mask(Views.tansuofanhui,10)
        mSleep(700)
        Auto.click_mask(Views.tansuofanhuiqueren,15)
        return true
    else
        setText("探索内")
        return true
    end
    return false
end

function doujirensu()
    if Auto.is_colors(Views.douji) then
        Auto.click(1390,651)
        mSleep(500)
        return true
    elseif Auto.is_colors(Views.doujifanpai) then
        Auto.click_mask(Views.doujifanpai)
        mSleep(600)
        Auto.click_mask(Views.rensuqueren)
        mSleep(500)
        return true
    end
    return false
end

function qiangce()
    if Auto.is_colors(Views.zuduijiemian) then
        keepScreen(false)
        while Auto.is_colors(Views.zuduijiemian) do
            toast("抢啊！")
            r = math.random()
            if r<0.94 then
                Auto.click(750,721,20)
                mSleep(math.random(0,20))
                begin = os.time()
                local iscolor = isColor(1416, 260, 0xe7c86a, 90)
                while os.time() - begin < 2 and iscolor == false do
                    mSleep(10)
                    iscolor = isColor(1416, 260, 0xe7c86a, 90)
                end
                if iscolor then
                    Auto.click(1423,259,8)
                    mSleep(math.random(0,20))
                    Auto.click(1423,259,8)
                    mSleep(math.random(0,20))
                end
            elseif r <0.98 then
                toast("小休息")
                mSleep(math.random(300,700))
            else
                toast("大休息")
                mSleep(math.random(1000,2000))
            end
            
        end
        return true
    end
    return false
end


function finish()
    toast("收工了~~",5)
    log("收工","阴阳师")

    pressHomeKey(0);    --按下 Home 键
    mSleep(1000)
    pressHomeKey(1);    --抬起 Home 键
    mSleep(100)
    lua_exit()
    mSleep(100)
end



-- 临时活动都放这里，，没活动清空返回false就行了
-- 临时活动都放这里，，没活动清空返回false就行了
-- 临时活动都放这里，，没活动清空返回false就行了
-- 临时活动都放这里，，没活动清空返回false就行了
-- 临时活动都放这里，，没活动清空返回false就行了
function linsihuodong()
    if multiColor({{132, 51, 0xf4e4a4},{1500, 58, 0xffffe6},{848, 167, 0x441d32}}) then
        x,y = findMultiColorInRegionFuzzy(0xffffda, "12|4|0xffffda", 90, 449, 374, 1400, 757)
        if x ~= -1 then
            Auto.click(x,y,20)
            mSleep(600)
            return true
        end
    end
    
    if multiColor({{1575, 686, 0xf1dfbd},{1490, 149, 0xcbbab6},{1499, 56, 0xffffeb}}) then
        Auto.click(1572,712,20)
        mSleep(600)
        return true
    end
    if multiColor({{907, 91, 0x831a11},{831, 104, 0xe4d8c3},{1121, 185, 0xd7413a},{835, 242, 0x403d39}}) then
        Auto.click(math.random(0,Width/10), math.random(Height/5,Height/5*4), 15)
        mSleep(500)
        Auto.click(math.random(0,Width/10), math.random(Height/5,Height/5*4), 15)
        return true
    end
    return false
end


function luanqibazao()
    -- 点业原火
    if AUTO.is_colors_tap(Views.yeyuanhuo) then
        return true
    -- 点御灵
    elseif AUTO.is_colors_tap(Views.yulin) then
        return true
    elseif qiangce() then
        return true
    -- 临时活动
    elseif linsihuodong() then
        return true
    end
    return false
end

function show_setting()
    local h,w = getScreenSize()
    UINew(1,"傻逼阴阳师","确定","取消","dsfds.dat",1,0,Width/2,Height,"255,255,255","255,255,255","","dot",1)
    UICombo(1,"manji","1个满级提醒,2个满级提醒,3个满级提醒,不提醒","1",Width/2.9)

    UILabel(1,"攻打次数",15,"left","255,0,0",Width/4,1)
    UIEdit(1,"count","打几次","30",15,"left","38,38,38","number",300)

    UILabel(1,"点准备",15,"left","255,0,0",Width/4,1)
    UISwitch(1,"dianzunbei","on","m","left")
    
    UILabel(1,"困28自动退出",15,"left","255,0,0",Width/4,1)
    UISwitch(1,"k28tuicu","off","m","left")
        
    UILabel(1,"日常地鬼喂养",15,"left","255,0,0",Width/4,1)
    UISwitch(1,"rican","off","m","left")

    UILabel(1,"自动标怪",15,"left","255,0,0",Width/4,1)
    UISwitch(1,"zidongbiaoguai","off","m","left")

    UILabel(1,"重新标记",15,"left","255,0,0",Width/4,1)
    UISwitch(1,"conxinbiaoji","off","m","left")

    UILabel(1,"直接认输",15,"left","255,0,0",Width/4,1)
    UISwitch(1,"rensu","off","m","left")

    UILabel(1,"个人结界9输4保级",15,"left","255,0,0",Width/4,1)
    UISwitch(1,"ninefour","on","m","left")

    UILabel(1,"随机点",15,"left","255,0,0",Width/4,1)
    UISwitch(1,"suijidian","off","m","left")




    

    UILabel(1,"有邀请接受邀请 攻打完返回桌面\n如果在阴阳寨界面就自动打结界\n随机点:战斗时随机滑动\n点准备:由于组队时不需要手动点准备\n困28队长走了自动退出,平时不需要开",15,"left","255,0,0",-1,1)

    UIShow()
    if manji == "2个满级提醒" then
        MANJI_COUNT = 2
    elseif manji == "3个满级提醒" then
        MANJI_COUNT = 3
    elseif manji == "不提醒" then
        MANJI_COUNT = 99
    elseif manji == "1个满级提醒" then
        MANJI_COUNT = 1
    end

    if suijidian == "on" then
        RANDOM_CLICK = true
    else
        RANDOM_CLICK = false
    end

    if dianzunbei == "on" then
        CLICK_ZUNBEI = true
    else
        CLICK_ZUNBEI = false
    end
    
    if k28tuicu == "on" then
        K28TUICU = true
    else
        K28TUICU = false
    end
    
    --结界9次输4次保级
    if ninefour == "on" then
        BAOJI = true
    else
        BAOJI = false
    end

    if rensu == "on" then
        RENSU = true
    else
        RENSU = false
    end

    if rican == "on" then
        script_switch("lua","rican")
    end
    
    
    if zidongbiaoguai == "on" then
        ZIDONG_BIAO_GUAI = true
    else
        ZIDONG_BIAO_GUAI = false
    end

    if conxinbiaoji == "on" then
        BIAOGUAI_X = -1
        BIAOGUAI_Y = -1
    end



    BATTLE_TIMES = tonumber(count)
end


function main()
    keepScreen(true)
    if (SENLI_COUNT + SIBAI_COUNT >= BATTLE_TIMES) then
        log("结束!","阴阳师")
        playAudio("ooo.mp3")
        for i=0,6,1 do
            toast(string.format("打完了 胜:%d 败:%d",SENLI_COUNT, SIBAI_COUNT),1)
            vibrator()                --振动
            mSleep(1000)            --延迟 1 秒
        end
        finish()
    else
        if battle() then
            mSleep(20)
        elseif yaoqin() then
            mSleep(20)
            RENSU_COUNT = 0
        elseif yinyanzai() then
            mSleep(20)
        elseif K28TUICU==true and zidonfanhui28() then
            mSleep(20)
            RENSU_COUNT = 0
        elseif luanqibazao() then
            mSleep(600)
            RENSU_COUNT = 0
        elseif RENSU == true and doujirensu() then
            mSleep(600)
            RENSU_COUNT = 0
        else
            setText("未知噢")
            mSleep(100)
        end
    end
    keepScreen(false)
end

show_setting()

local ttt = os.time()
while true do
    if isFrontApp("com.netease.onmyoji") == 0 then
        setText(string.format("%d脚本没关哦",os.time() - ttt))
        mSleep(1200)
    else
        main()
        ttt = os.time()

        local t = os.time() - LAST_BATTLE_TIME
        --70秒没有打仗
        if t > 180 and t <600 then
            setText("3分钟没打架咯")
            vibrator()
            mSleep(1000)
        elseif t>600 then
            toast("10分钟没打架咯,拜拜")
            vibrator()
            mSleep(2000)
            finish()
        end
    end
end

