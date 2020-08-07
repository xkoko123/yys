init(1)
Auto = require("auto")
Height,Width = getScreenSize();


iphone = {}
--准备
iphone.zunbei = {color={{1575, 633, 0xd2ae7c}, {1560, 621, 0xfff2ce}, {1598, 637, 0xd18444}}}

--战斗中
iphone.zandouzon = {color={{1773, 634, 0x42326b},{1776, 508, 0x745d47},{1786, 568, 0xa2917d}}}

--胜利失败
iphone.senli1 = {color={{943, 178, 0xe9ce7b}, {956, 215, 0x7c1b14}, {1104, 170, 0xf6f0d2}}}
iphone.senli2 = {color={{1001, 680, 0xa7681c}, {981, 690, 0x800d0e}, {980, 624, 0x7c7472}}} --尽量下面点,爆东西多会遮住
              --{color={{817, 614, 0x3a82c9}, {799, 481, 0xdf901b}, {875, 617, 0x2d1814}}}  
iphone.sibai = {color={{695, 175, 0x4f4758}, {697, 203, 0xb9a790}, {677, 211, 0x595063}}}
iphone.zuduisibai = {color={{700, 113, 0x4f4758}, {678, 153, 0x5b5265}, {698, 140, 0xb7a58f}}}
iphone.zuduisenli = {color={{974, 132, 0xa8261c}, {1100, 108, 0xffffea}, {943, 199, 0xead07b}}}

-- 胜利时，左上角会先出现一个战斗信息图标
iphone.zandousenlirighttop = {color={{81, 81, 0xa77e53}, {86, 81, 0x3a291f}, {91, 81, 0xa77e53}, {96, 81, 0x32231b}}}
iphone.zandousenlirightbottom = {color={{76, 758, 0x30211a}, {74, 758, 0x977750}, {71, 758, 0x36261d}}}

--满级标志
iphone.manji = {color={{263, 457, 0xff9e1a}, {268, 473, 0xffe405}, {249, 474, 0xfbe505}}, region={152, 219, 1527, 758}}
--接受拒绝邀请按钮 (平常与超鬼王)
iphone.jiesouyaoqinmoren = {color={{358, 288, 0xedc791}, {358, 308, 0x55af5f}, {382, 300, 0x62bb6c}, {357, 322, 0x87705c}}}
iphone.jiesouyaoqin = {color={{250, 304, 0x5eb969}, {250, 280, 0x856e58}, {270, 286, 0x58b563}}}

iphone.jiesouyaoqinmoren2 = {color={{358, 288, 0xedc791}, {358, 308, 0x55af5f}, {382, 300, 0x62bb6c}, {357, 322, 0x87705c}}}
iphone.jiesouyaoqin2 = {color={{246, 431, 0x56b361}, {266, 414, 0x5eb869}, {252, 403, 0x876f5b}}}

--协战队伍界面(等挑战)
iphone.xiezanduiwujiemian = {color={{138, 41, 0xf6e9ab}, {1650, 583, 0x63525a}, {602, 369, 0xbbaf8f}}}


--寨结界 界面
iphone.zaijiejie = {color={{264, 756, 0xc9a87b},{1520, 76, 0xe8d4cf},{1016, 56, 0xe4c55b}}}
--个人结界 界面
iphone.gerenjiejie = {color={{420, 716, 0xf3b25e},{352, 628, 0xa5521e},{1520, 76, 0xe8d4cf}}}


--寨结界的进攻按钮 多个点，点击第一个
--寨的，寨的左右都有黄色{}
iphone.zaijiejiejinggong = {color={{1303, 400, 0xf3b25e}, {1119, 398, 0xf3b25e}, {1211, 399, 0xcbb59c}, {1305, 459, 0x6a4737}}, region={244, 12, 1572, 818}}

--个人的，个人的只有一个黄色
iphone.gerenjiejiefankuai = {color={{509, 130, 0xd1c2af}, {507, 115, 0x9d8b77}, {318, 162, 0x9c8976}, {351, 171, 0x603f20}}, region={298, 89, 1495, 579}}
iphone.gerenjiejiejinggong = {color={{988, 545, 0xf3b25e}, {920, 516, 0x983d2e}, {1056, 572, 0x973c2e}, {991, 577, 0xd78230}}, region={244, 12, 1572, 818}}

iphone.gerenjiejiesuzi8 = {color={{498, 624, 0x792e0a}, {505, 623, 0xebe6d4}, {511, 624, 0x742b08}, {505, 619, 0x792c09}, {505, 629, 0x7a2c09}, {499, 629, 0xc4beae}, {509, 618, 0xe0dbc9}, {499, 619, 0x9d9687}, {505, 633, 0xb5ad9d}}}
iphone.jiejiesibaiarrow = {color={{659, 444, 0xdbba63}, {682, 426, 0xa73131}, {684, 435, 0xb03737}, {670, 437, 0x49382a}}, region={563, 84, 1502, 573}}


iphone.zaijiejie_fankuan = {color={{844, 194, 0xd5c8b8}, {671, 187, 0x5e3d1e}, {1007, 131, 0x9b8774}, {1003, 260, 0xddcfb7}}, region={622, 86, 1413, 436}}
iphone.zaijiejiejingon_hui = {color={{1302, 561, 0xb0a9a1}, {1121, 559, 0xf3b25e}, {1372, 535, 0x685e5d}, {1395, 565, 0xcbb59c}}, region={607, 98, 1422, 775}}


--正在经验探索里面
iphone.tansuolei = {color={{1030, 21, 0xfaca3b}, {1041, 40, 0xfadcc2}, {1252, 26, 0xdb3b25}}}
--经验探索返回确认按钮
iphone.tansuofanhuiqueren = {color={{1056, 466, 0xf3b25e}, {896, 464, 0xcbb59c}, {738, 462, 0xf3b25e}}}
--探索返回
iphone.tansuofanhui = {color={{130, 74, 0xf0f5fb}}}

--战斗中界面来消息了震动
iphone.message = {color={{224, 20, 0xc8cbd7},{225, 32, 0xc6c8d6}}}
iphone.messagepop = {color={{232, 115, 0xd6c9b9},{232, 128, 0xd6c9b9},{231, 146, 0xd6c9b9},{223, 128, 0xd6c9b9}}}

--战斗中认输按钮
iphone.rensu = {color={{132, 37, 0x3c3526}}}
iphone.rensuqueren = {color={{1017, 488, 0xf3b25e}}}

--痴界面，第一个点是挑战
iphone.yeyuanhuo = {color={{1499, 740, 0xe3d8c2}, {1248, 316, 0xdc81b3}, {1127, 316, 0x261d20}, {1193, 523, 0x2eac91}, {1038, 497, 0xb93729}}}
iphone.yulin = {color={{1480, 725, 0xe4d9c2}, {1261, 32, 0x9c804d}, {1266, 40, 0x3d3d3d}, {1247, 46, 0xbec0bb}, {1262, 63, 0xc7c9ba}}}

iphone.zuduijiemian = {color={{221, 64, 0xe3decc}, {138, 42, 0xf5e6a7}, {275, 101, 0x7e532b}, {1530, 112, 0x473028}, {275, 673, 0x3d2423}}}


iphone.douji = {color={{1515, 158, 0xe5b9ba}, {373, 714, 0xe47755}, {421, 753, 0xd9951c}}}
iphone.doujifanpai = {color={{143, 36, 0xd6c4a1}, {39, 180, 0x826952}, {165, 615, 0x4742b3}}}
pad = {}


Height,Width = getScreenSize();
if Width == 1792 then
    return iphone
else
    return pad
end