iphone = {}
--准备
iphone.zunbei = {color={{1575, 633, 0xd2ae7c}, {1560, 621, 0xfff2ce}, {1598, 637, 0xd18444}}}

--战斗中
iphone.zandouzon = {color={{1719, 773, 0x291a19}, {1765, 674, 0x5b5467}, {126, 51, 0xd6c4a1}, {1780, 78, 0x704a23}}}

--胜利失败
iphone.senli1 = {color={{712, 219, 0xcebfab}, {715, 193, 0x7c1910}, {691, 229, 0x931b11}}}
iphone.senli2 = {color={{727, 720, 0x8eadda}, {727, 709, 0x94e7f8}, {717, 701, 0x3d84ca}}} --尽量下面点,爆东西多会遮住
              --{color={{817, 614, 0x3a82c9}, {799, 481, 0xdf901b}, {875, 617, 0x2d1814}}}  
iphone.sibai = {color={{695, 175, 0x4f4758}, {697, 203, 0xb9a790}, {677, 211, 0x595063}}}
iphone.zuduisibai = {color={{700, 113, 0x4f4758}, {678, 153, 0x5b5265}, {698, 140, 0xb7a58f}}}
iphone.zuduisenli = {color={{714, 127, 0x7c1910}, {693, 165, 0x941b11}, {705, 147, 0xccbda8}}}

--满级标志
iphone.manji = {color={{390, 166, 0xec9119}, {387, 174, 0xfebc11}, {402, 171, 0xffaf15}}, region={37,150,1469,717}}

--接受拒绝邀请按钮 (平常与超鬼王)
iphone.jiesouyaoqinmoren = {color={{358, 288, 0xedc791}, {358, 308, 0x55af5f}, {382, 300, 0x62bb6c}, {357, 322, 0x87705c}}}
iphone.jiesouyaoqin = {color={{250, 304, 0x5eb969}, {250, 280, 0x856e58}, {270, 286, 0x58b563}}}

iphone.jiesouyaoqinmoren2 = {color={{358, 288, 0xedc791}, {358, 308, 0x55af5f}, {382, 300, 0x62bb6c}, {357, 322, 0x87705c}}}
iphone.jiesouyaoqin2 = {color={{246, 431, 0x56b361}, {266, 414, 0x5eb869}, {252, 403, 0x876f5b}}}

--协战队伍界面(等挑战)
iphone.xiezanduiwujiemian = {color={{138, 41, 0xf6e9ab}, {1650, 583, 0x63525a}, {602, 369, 0xbbaf8f}}}



iphone.zaimianban = {color={{1520, 78, 0xe8d4cf}, {248, 30, 0x5a3b21}, {873, 65, 0xf8f3e0}, {1017, 58, 0xe2c258}, {1471, 788, 0x3f3541}, {289, 431, 0x524234}}}

--寨结界的进攻按钮 多个点，点击第一个
--寨的，寨的左右都有黄色{}
iphone.jiejiejingon1 = {color={{1303, 400, 0xf3b25e}, {1119, 398, 0xf3b25e}, {1211, 399, 0xcbb59c}, {1305, 459, 0x6a4737}}, region={244, 12, 1572, 818}}

--个人的，个人的只有一个黄色
iphone.jiejiejingon = {color={{988, 545, 0xf3b25e}, {920, 516, 0x983d2e}, {1056, 572, 0x973c2e}, {991, 577, 0xd78230}}, region={244, 12, 1572, 818}}

-- iphone.jiejiejingon = {color={{912, 513, 0xf3b25e}, {822, 513, 0xcbb59c}, {732, 509, 0xf3b25e}}, region={607, 98, 1422, 775}}
-- --寨结界 每一个人的小方框，第一个点中间点击位置，注意要把右上角点上，表示不打失败的
-- iphone.zaijiejie_fankuan = {color={{832, 346, 0xd5c8b8}, {637, 280, 0xc6b29b}, {1010, 280, 0xc6b29b}, {694, 382, 0x4f3e1e}, {726, 352, 0x3f2b29}}, region={299, 104, 1512, 617}}

iphone.zaijiejie_fankuan = {color={{841, 193, 0xd5c8b8}, {1011, 127, 0xc6b29b}, {1005, 263, 0xab8e6c}, {640, 261, 0x9b8774}, {640, 131, 0x9b8774}}, region={299, 104, 1512, 617}}
iphone.jiejiejingon_hui = {color={{1302, 561, 0xb0a9a1}, {1121, 559, 0xf3b25e}, {1372, 535, 0x685e5d}, {1395, 565, 0xcbb59c}}, region={607, 98, 1422, 775}}


--正在经验探索里面
iphone.tansuolei = {color={{1250, 26, 0xfa8a31}, {1506, 662, 0xffc55b}, {12, 818, 0x344a3a}, {132, 74, 0xf0f5fb}}}
--经验探索返回确认按钮
iphone.tansuofanhuiqueren = {color={{1056, 466, 0xf3b25e}, {896, 464, 0xcbb59c}, {738, 462, 0xf3b25e}}}
--探索返回
iphone.tansuofanhui = {color={{130, 74, 0xf0f5fb}}}

--战斗中界面来消息了震动
iphone.message = {color={{224, 20, 0xc8cbd7},{225, 32, 0xc6c8d6}}}
iphone.messagepop = {color={{232, 115, 0xd6c9b9},{232, 128, 0xd6c9b9},{231, 146, 0xd6c9b9},{223, 128, 0xd6c9b9}}}
pad = {}

------------------------------
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

-- 上一次遇见未知场景的时间
LAST_UNKNOW_TIME = 0

-- 返回true表示已经手工点准备了
function manji_jianca()
    keepScreen(false)
    --检查满级个数
    local count = Auto.find_colors_all(Btns.manji,90,10,100)
    count = #count
    setText(string.format("准备: 满级%d个",count))

    if count >= MANJI_COUNT then
        playAudio("manji.mp3")
        log(string.format("满级%d个",count),"阴阳师")
        for i=0,17,1 do
            toast(string.format("满级满级%d个 换狗粮倒计时%d",count, 17-i),1)
            vibrator()
            mSleep(1000)
            if Auto.is_colors(Btns.zunbei) == false then
                playAudio("")
                return true
            end
        end
        playAudio("")
    end
    return false
end

fwShowWnd("msgwnd",Width-400, -1, Width, 20,0); 
function setText(text)
    local xx = string.format(" 胜:%d 负:%d",SENLI_COUNT, SIBAI_COUNT)
    fwShowTextView("msgwnd","msg",text..xx,"left","EFD4CF","183F76",10,0,0,0,400,20,1,0)
    mSleep(100)
end

function battle() 
    if Auto.is_colors(Btns.zandouzon) then
        keepScreen(false)
        log("战斗中","阴阳师")
        local begin = os.time()
        while Auto.is_colors(Btns.zandouzon) do
            if RANDOM_CLICK and math.random()<0.01 then
                Auto.swipe(math.random(Width/6, Width/6*5), math.random(Height/4, Height/4*3), math.random(Width/6, Width/6*5), math.random(Height/4, Height/4*3))
                if math.random()<0.02 then
                    mSleep(150)
                    Auto.swipe(math.random(Width/6, Width/6*5), math.random(Height/4, Height/4*3), math.random(Width/6, Width/6*5), math.random(Height/4, Height/4*3))
                end
            end

            setText(string.format("%02d战斗中",os.time() - begin))
            
            if Auto.is_colors(Btns.message, 80) or Auto.is_colors(Btns.messagepop,95) then
                playAudio("ooo.wav")
                vibrator()
                mSleep(1200)
            end
            mSleep(math.random(500,800))
        end

        return true
    elseif CLICK_ZUNBEI == true and Auto.is_colors(Btns.zunbei) then
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

        Auto.click_mask(Btns.zunbei,15)
        mSleep(200)
        LAST_BATTLE_TIME = os.time()
        return true
    elseif Auto.is_colors(Btns.senli1) or Auto.is_colors(Btns.zuduisenli) then
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
    elseif Auto.is_colors(Btns.senli2) then
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
        return true

    elseif Auto.is_colors(Btns.sibai) or Auto.is_colors(Btns.zuduisibai) then
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
    if Auto.is_colors(Btns.jiesouyaoqinmoren) or Auto.is_colors(Btns.jiesouyaoqinmoren2) then
        setText("有人邀请咯 默认")
        Auto.is_colors_tap(Btns.jiesouyaoqinmoren, 25)
        -- Auto.is_colors_tap(Btns.jiesouyaoqinmoren2, 25)
        return true
    elseif Auto.is_colors(Btns.jiesouyaoqin) or Auto.is_colors(Btns.jiesouyaoqin2) then
        setText("有人邀请咯")
        Auto.is_colors_tap(Btns.jiesouyaoqin, 25)
        -- Auto.is_colors_tap(Btns.jiesouyaoqin2, 25)
        return true
    elseif Auto.is_colors(Btns.xiezanduiwujiemian,99) then
        keepScreen(false)
        setText("协战队伍界面")
        begin = os.time()
        log("协战队伍 等人","阴阳师")
        while Auto.is_colors(Btns.xiezanduiwujiemian) do    
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
    if Auto.is_colors(Btns.zaimianban) == false then
        return false
    end
    keepScreen(false)
    setText("阴阳寨")

    local fankuai_x, fankuai_y = Auto.find_colors(Btns.zaijiejie_fankuan,99)
    if fankuai_x ~= -1 then
        Auto.click(fankuai_x,fankuai_y,15)
        mSleep(1000)

        local x,y = Auto.find_colors(Btns.jiejiejingon_hui,95,0)
        if x ~= -1 then
            for i = 1, 10, 1 do
                toast("没次数咯没次数咯",0.5)
                vibrator()
                mSleep(500)
            end
            finish()
            return true
        end
        --先找寨结界的进攻按钮
        local x, y = Auto.find_colors(Btns.jiejiejingon1,95,0)
        if x ~= -1 then
            Auto.click(x,y,10)
            mSleep(1000)
            return true
        else
            --找个人结界的进攻按钮
            local x1, y1 = Auto.find_colors(Btns.jiejiejingon,95,0)
            if x1 ~= -1 then
                Auto.click(x1,y1,10)
                mSleep(1000)
                return true
            --找不到关闭面板
            else
                Auto.click(fankuai_x,fankuai_y,10)
                mSleep(1000)
                return true
            end
        end
    elseif fankuai_x == -1 then
        toast("找不到方块 滑动",0.2)
        Auto.swipe(Width/2, 450, Width/2, 200)
        mSleep(1000)
        return true
    end
    return false
end

--困28 自动退队
function zidonfanhui28()
    duizan_tubiao = {color={{126, 164, 0x5f3e1f},{126, 138, 0xf6f1b5},{138, 152, 0x4e3014}}}
    if Auto.is_colors(Btns.tansuolei,95) == false then
        return false
    end
    if Auto.is_colors(duizan_tubiao, 95,0) == false then
        setText("队长跑啦")
        if math.random()<0.1 then
            mSleep(1000)
        end
        Auto.click_mask(Btns.tansuofanhui,10)
        mSleep(800)
        Auto.click_mask(Btns.tansuofanhuiqueren,15)
        mSleep(800)
        return true
    else
        setText("探索内")
        if math.random() < 0.05 then
            toast("我滑！", 0.5)
            local x1 = math.random(Width/5, Width/5*4)
            local y1 = math.random(Height/4, Height/4*3)
            local x2 = math.random(Width/5, Width/5*4)
            local y2 = math.random(Height/4, Height/4*3)
            if math.abs(x1- x2) < 150 then
                x2 = x1 + 150
            end
            Auto.swipe(x1, y1, x2, y2)
        end
        mSleep(800)
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


function show_setting()
    local h,w = getScreenSize()
    UINew(1,"傻逼阴阳师","确定","取消","dsfds.dat",1,0,Width/2,Height,"255,255,255","255,255,255","","dot",1)
    UICombo(1,"manji","1个满级提醒,2个满级提醒,3个满级提醒,不提醒","1",400)

    UILabel(1,"攻打次数",15,"left","255,0,0",150,1)
    UIEdit(1,"count","打几次","30",15,"left","38,38,38","number",300)

    UILabel(1,"随机点",15,"left","255,0,0",150,1)
    UISwitch(1,"suijidian","off","m","left")

    UILabel(1,"点准备",15,"left","255,0,0",150,1)
    UISwitch(1,"dianzunbei","on","m","left")
    
    UILabel(1,"困28自动退出",15,"left","255,0,0",150,1)
    UISwitch(1,"k28tuicu","off","m","left")
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


    BATTLE_TIMES = tonumber(count)
end


show_setting()


-- if isFrontApp("com.netease.onmyoji") == 0 then
--     runApp("com.netease.onmyoji")
--     mSleep(0)
-- end

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
            mSleep(70)
            LAST_UNKNOW_TIME = 0
        elseif yaoqin() then
            mSleep(70)
            LAST_UNKNOW_TIME = 0
        elseif yinyanzai() then
            mSleep(70)
            LAST_UNKNOW_TIME = 0
        elseif K28TUICU==true and zidonfanhui28() then
            mSleep(70)
            LAST_UNKNOW_TIME = 0
        else
            if LAST_UNKNOW_TIME == 0 then
                setText("00 unknow@")
                LAST_UNKNOW_TIME = os.time()
                mSleep(50)
            else
                if os.time() - LAST_UNKNOW_TIME < 6 then
                    setText(string.format("%02d unknow@", os.time()-LAST_UNKNOW_TIME))
                    mSleep(50)
                else
                    setText(string.format("%02d unknow", os.time()-LAST_UNKNOW_TIME))
                    mSleep(1500)
                end
            end
                
        end
    end
    keepScreen(false)

    local t = os.time() - LAST_BATTLE_TIME
    --70秒没有打仗
    if t > 80 and t <300 then
        setText("80秒没打架咯")
        vibrator()                --振动
        mSleep(1000)            --延迟 1 秒
    elseif t>300 and t<600 then
        setText("5分钟没打架咯")
        vibrator()                --振动
        mSleep(500)            --延迟 1 秒
    elseif t>600 then
        toast("10分钟没打架咯,拜拜")
        vibrator()                --振动
        mSleep(2000)            --延迟 1 秒
        finish()
    end
end

local ttt = os.time()
while true do
    if isFrontApp("com.netease.onmyoji") == 0 then
        setText(string.format("%d脚本没关哦",os.time() - ttt))
        mSleep(1200)
    else
        main()
        ttt = os.time()
    end
end
