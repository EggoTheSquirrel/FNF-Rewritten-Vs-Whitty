return Sprite (
	love.graphics.newImage(graphics.imagePath("whitty/girlfriend-sway")),
    {
		{x = 5, y = 5, width = 355, height = 432, offsetX = 0, offsetY = 0, offsetWidth = 0, offsetHeight = 0}, -- 1: Idle Left0000
		{x = 370, y = 5, width = 355, height = 432, offsetX = 0, offsetY = 0, offsetWidth = 0, offsetHeight = 0}, -- 2: Idle Left0001
		{x = 370, y = 5, width = 355, height = 432, offsetX = 0, offsetY = 0, offsetWidth = 0, offsetHeight = 0}, -- 3: Idle Left0002
		{x = 735, y = 5, width = 355, height = 432, offsetX = 0, offsetY = 0, offsetWidth = 0, offsetHeight = 0}, -- 4: Idle Left0003
		{x = 1100, y = 5, width = 355, height = 432, offsetX = 0, offsetY = 0, offsetWidth = 0, offsetHeight = 0}, -- 5: Idle Left0004
		{x = 1100, y = 5, width = 355, height = 432, offsetX = 0, offsetY = 0, offsetWidth = 0, offsetHeight = 0}, -- 6: Idle Left0005
		{x = 1465, y = 5, width = 360, height = 433, offsetX = 0, offsetY = 0, offsetWidth = 0, offsetHeight = 0}, -- 7: Idle Right0000
		{x = 5, y = 448, width = 360, height = 433, offsetX = 0, offsetY = 0, offsetWidth = 0, offsetHeight = 0}, -- 8: Idle Right0001
		{x = 5, y = 448, width = 360, height = 433, offsetX = 0, offsetY = 0, offsetWidth = 0, offsetHeight = 0}, -- 9: Idle Right0002
		{x = 375, y = 448, width = 360, height = 433, offsetX = 0, offsetY = 0, offsetWidth = 0, offsetHeight = 0}, -- 10: Idle Right0003
		{x = 745, y = 448, width = 360, height = 433, offsetX = 0, offsetY = 0, offsetWidth = 0, offsetHeight = 0}, -- 11: Idle Right0004
		{x = 745, y = 448, width = 360, height = 433, offsetX = 0, offsetY = 0, offsetWidth = 0, offsetHeight = 0}, -- 12: Idle Right0005
		{x = 1115, y = 448, width = 325, height = 425, offsetX = 0, offsetY = 0, offsetWidth = 0, offsetHeight = 0}, -- 13: Sad0000
		{x = 1115, y = 448, width = 325, height = 425, offsetX = 0, offsetY = 0, offsetWidth = 0, offsetHeight = 0}, -- 14: Sad0001
		{x = 1450, y = 448, width = 325, height = 425, offsetX = 0, offsetY = 0, offsetWidth = 0, offsetHeight = 0}, -- 15: Sad0002
		{x = 1450, y = 448, width = 325, height = 425, offsetX = 0, offsetY = 0, offsetWidth = 0, offsetHeight = 0}, -- 16: Sad0003
		{x = 5, y = 891, width = 325, height = 425, offsetX = 0, offsetY = 0, offsetWidth = 0, offsetHeight = 0}, -- 17: Sad0004
		{x = 5, y = 891, width = 325, height = 425, offsetX = 0, offsetY = 0, offsetWidth = 0, offsetHeight = 0}, -- 18: Sad0005
		{x = 340, y = 891, width = 325, height = 425, offsetX = 0, offsetY = 0, offsetWidth = 0, offsetHeight = 0}, -- 19: Sad0006
		{x = 340, y = 891, width = 325, height = 425, offsetX = 0, offsetY = 0, offsetWidth = 0, offsetHeight = 0}, -- 20: Sad0007
		{x = 1115, y = 448, width = 325, height = 425, offsetX = 0, offsetY = 0, offsetWidth = 0, offsetHeight = 0}, -- 21: Sad0008
		{x = 1115, y = 448, width = 325, height = 425, offsetX = 0, offsetY = 0, offsetWidth = 0, offsetHeight = 0}, -- 22: Sad0009
		{x = 1450, y = 448, width = 325, height = 425, offsetX = 0, offsetY = 0, offsetWidth = 0, offsetHeight = 0}, -- 23: Sad0010
		{x = 1450, y = 448, width = 325, height = 425, offsetX = 0, offsetY = 0, offsetWidth = 0, offsetHeight = 0}, -- 24: Sad0011
		{x = 675, y = 891, width = 357, height = 432, offsetX = 0, offsetY = 0, offsetWidth = 0, offsetHeight = 0}, -- 25: Scared0000
		{x = 1042, y = 891, width = 357, height = 432, offsetX = 0, offsetY = 0, offsetWidth = 0, offsetHeight = 0}, -- 26: Scared0001
		{x = 1409, y = 891, width = 357, height = 432, offsetX = 0, offsetY = 0, offsetWidth = 0, offsetHeight = 0}, -- 27: Scared0002
		{x = 5, y = 1333, width = 357, height = 432, offsetX = 0, offsetY = 0, offsetWidth = 0, offsetHeight = 0} -- 28: Scared0003
	},
	{
		["idle"] = {start = 1, stop = 12, speed = 24, offsetX = 0, offsetY = 0},
		["sad"] = {start = 13, stop = 24, speed = 24, offsetX = 0, offsetY = 0},
		["scared"] = {start = 25, stop = 28, speed = 24, offsetX = 0, offsetY = 0}
	},
	"idle",
	false
)