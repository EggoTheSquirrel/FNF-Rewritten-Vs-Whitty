return Sprite (
    love.graphics.newImage(graphics.imagePath("whitty/street-ballistic")),
	{
		{x = 0, y = 0, width = 2560, height = 1400, offsetX = -0, offsetY = -0, offsetWidth = 2560, offsetHeight = 1402}, -- 1: Background Whitty Moving0000
		{x = 0, y = 0, width = 2560, height = 1400, offsetX = -0, offsetY = -0, offsetWidth = 2560, offsetHeight = 1402}, -- 2: Background Whitty Moving0001
		{x = 2560, y = 0, width = 2560, height = 1402, offsetX = -0, offsetY = -0, offsetWidth = 2560, offsetHeight = 1402}, -- 3: Background Whitty Moving0002
		{x = 2560, y = 0, width = 2560, height = 1402, offsetX = -0, offsetY = -0, offsetWidth = 2560, offsetHeight = 1402}, -- 4: Background Whitty Moving0003
		{x = 5120, y = 0, width = 2560, height = 1400, offsetX = -0, offsetY = -0, offsetWidth = 2560, offsetHeight = 1402}, -- 5: Background Whitty Moving0004
		{x = 5120, y = 0, width = 2560, height = 1400, offsetX = -0, offsetY = -0, offsetWidth = 2560, offsetHeight = 1402}, -- 6: Background Whitty Moving0005
		{x = 0, y = 1402, width = 2560, height = 1400, offsetX = -0, offsetY = -0, offsetWidth = 2560, offsetHeight = 1402}, -- 7: Background Whitty Moving0006
		{x = 0, y = 1402, width = 2560, height = 1400, offsetX = -0, offsetY = -0, offsetWidth = 2560, offsetHeight = 1402}, -- 8: Background Whitty Moving0007
		{x = 2560, y = 1402, width = 2560, height = 1400, offsetX = -0, offsetY = -0, offsetWidth = 2560, offsetHeight = 1400}, -- 9: Background Whitty Start0000
		{x = 2560, y = 1402, width = 2560, height = 1400, offsetX = -0, offsetY = -0, offsetWidth = 2560, offsetHeight = 1400}, -- 10: Background Whitty Startup0000
		{x = 5120, y = 1402, width = 2560, height = 1400, offsetX = -0, offsetY = -0, offsetWidth = 2560, offsetHeight = 1400}, -- 11: Background Whitty Startup0001
		{x = 0, y = 2802, width = 2560, height = 1400, offsetX = -0, offsetY = -0, offsetWidth = 2560, offsetHeight = 1400}, -- 12: Background Whitty Startup0002
		{x = 2560, y = 2802, width = 2560, height = 1400, offsetX = -0, offsetY = -0, offsetWidth = 2560, offsetHeight = 1400}, -- 13: Background Whitty Startup0003
		{x = 5120, y = 2802, width = 2560, height = 1400, offsetX = -0, offsetY = -0, offsetWidth = 2560, offsetHeight = 1400}, -- 14: Background Whitty Startup0004
		{x = 0, y = 4202, width = 2560, height = 1400, offsetX = -0, offsetY = -0, offsetWidth = 2560, offsetHeight = 1400} -- 15: Background Whitty Startup0005
	},
    {
        ["moving"] = {start = 1, stop = 8, speed = 24, offsetX = 0, offsetY = 0}
    },
    "moving",
    true
)