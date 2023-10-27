local alpha = require("alpha")
local dashboard = require("alpha.themes.dashboard")

local function pick_color()
	local colors = { "String", "Identifier", "Keyword", "Number" }
	return colors[math.random(#colors)]
end

local logo = {

	"            :h-                                  Nhy`               ",
	"           -mh.                           h.    `Ndho               ",
	"           hmh+                          oNm.   oNdhh               ",
	"          `Nmhd`                        /NNmd  /NNhhd               ",
	"          -NNhhy                      `hMNmmm`+NNdhhh               ",
	"          .NNmhhs              ```....`..-:/./mNdhhh+               ",
	"           mNNdhhh-     `.-::///+++////++//:--.`-/sd`               ",
	"           oNNNdhhdo..://++//++++++/+++//++///++/-.`                ",
	"      y.   `mNNNmhhhdy+/++++//+/////++//+++///++////-` `/oos:       ",
	" .    Nmy:  :NNNNmhhhhdy+/++/+++///:.....--:////+++///:.`:s+        ",
	" h-   dNmNmy oNNNNNdhhhhy:/+/+++/-         ---:/+++//++//.`         ",
	" hd+` -NNNy`./dNNNNNhhhh+-://///    -+oo:`  ::-:+////++///:`        ",
	" /Nmhs+oss-:++/dNNNmhho:--::///    /mmmmmo  ../-///++///////.       ",
	"  oNNdhhhhhhhs//osso/:---:::///    /yyyyso  ..o+-//////////:/.      ",
	"   /mNNNmdhhhh/://+///::://////     -:::- ..+sy+:////////::/:/.     ",
	"     /hNNNdhhs--:/+++////++/////.      ..-/yhhs-/////////::/::/`    ",
	"       .ooo+/-::::/+///////++++//-/ossyyhhhhs/:///////:::/::::/:    ",
	"       -///:::::::////++///+++/////:/+ooo+/::///////.::://::---+`   ",
	"       /////+//++++/////+////-..//////////::-:::--`.:///:---:::/:   ",
	"       //+++//++++++////+++///::--                 .::::-------::   ",
	"       :/++++///////////++++//////.                -:/:----::../-   ",
	"       -/++++//++///+//////////////               .::::---:::-.+`   ",
	"       `////////////////////////////:.            --::-----...-/    ",
	"        -///://////////////////////::::-..      :-:-:-..-::.`.+`    ",
	"         :/://///:///::://::://::::::/:::::::-:---::-.-....``/- -   ",
	"           ::::://::://::::::::::::::----------..-:....`.../- -+oo/ ",
	"            -/:::-:::::---://:-::-::::----::---.-.......`-/.      ``",
	"           s-`::--:::------:////----:---.-:::...-.....`./:          ",
	"          yMNy.`::-.--::..-dmmhhhs-..-.-.......`.....-/:`           ",
	"         oMNNNh. `-::--...:NNNdhhh/.--.`..``.......:/-              ",
	"        :dy+:`      .-::-..NNNhhd+``..`...````.-::-`                ",
	"                        .-:mNdhh:.......--::::-`                    ",
	"                           yNh/..------..`                          ",
	"                                                                    ",
}

dashboard.section.header.val = logo
dashboard.section.header.opts.hl = pick_color()

dashboard.section.buttons.val = {
	dashboard.button("e", "  File Explorer", ":Telescope find_files<CR>"),
	dashboard.button("r", " Old Files", ":Telescope oldfiles<CR>"),
	dashboard.button("q", "  Quit", ":qa<cr>"),
}

alpha.setup(dashboard.opts)
