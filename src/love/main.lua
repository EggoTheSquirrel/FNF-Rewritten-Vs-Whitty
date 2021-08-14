--[[----------------------------------------------------------------------------
Friday Night Funkin' Rewritten v1.0.1-switch

Copyright (C) 2021  HTV04

This program is free software: you can redistribute it and/or modify
it under the terms of the GNU General Public License as published by
the Free Software Foundation, either version 3 of the License, or
(at your option) any later version.

This program is distributed in the hope that it will be useful,
but WITHOUT ANY WARRANTY; without even the implied warranty of
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
GNU General Public License for more details.

You should have received a copy of the GNU General Public License
along with this program.  If not, see <https://www.gnu.org/licenses/>.
------------------------------------------------------------------------------]]

function love.load()
	-- Load libraries
	baton = require "lib.baton"
	Class = require "lib.class"
	ini = require "lib.ini"
	lovesize = require "lib.lovesize"
	Gamestate = require "lib.gamestate"
	Timer = require "lib.timer"
	
	-- Load objects
	require "classes"
	require "modules"
	
	-- Create, read, and apply settings
	settingsStr = [[
; Friday Night Funkin' Rewritten Settings

[Game]
; "Downscroll" makes arrows scroll down instead of up, and also moves some aspects of the UI around
downscroll=false

; "Kade Input" disables anti-spam, but counts "Shit" inputs as misses
; NOTE: Currently unfinished, some aspects of this input mode still need to be implemented, like mash violations
kadeInput=true

[Advanced]
; Show debug info on the screen
; Possible values: false, fps, detailed
showDebug=false

; These variables are read by the game for internal purposes, don't edit these unless you want to risk losing your current settings!
[Data]
settingsVer=3-switch
]]
	
	if love.filesystem.getInfo("settings.ini") then
		settingsIni = ini.load("settings.ini")
		
		if not settingsIni["Data"] or ini.readKey(settingsIni, "Data", "settingsVer") ~= "3-switch" then
			love.window.showMessageBox("Warning", "The current settings file is outdated, and will now be reset.")
			
			local success, message = love.filesystem.write("settings.ini", settingsStr)
			
			if success then
				love.window.showMessageBox("Success", "Settings file successfully created: \"" .. love.filesystem.getSaveDirectory() .. "/settings.ini\"")
			else
				love.window.showMessageBox("Error", message)
			end
		end
	else
		local success, message = love.filesystem.write("settings.ini", settingsStr)
		
		if success then
			love.window.showMessageBox("Success", "Settings file successfully created: \"" .. love.filesystem.getSaveDirectory() .. "/settings.ini\"")
		else
			love.window.showMessageBox("Error", message)
		end
	end
	
	settingsIni = ini.load("settings.ini")
	settings = {}
	
	if ini.readKey(settingsIni, "Game", "downscroll") == "true" then
		settings.downscroll = true
	else
		settings.downscroll = false
	end
	if ini.readKey(settingsIni, "Game", "kadeInput") == "true" then
		settings.kadeInput = true
	else
		settings.kadeInput = false
	end
	
	if ini.readKey(settingsIni, "Advanced", "showDebug") == "fps" or ini.readKey(settingsIni, "Advanced", "showDebug") == "detailed" then
		settings.showDebug = ini.readKey(settingsIni, "Advanced", "showDebug")
	else
		settings.showDebug = false
	end
	
	-- Load engine
	menu = require "menu"
	weeks = require "weeks"
	
	-- Load week data
	weekData = {
		require "weeks.tutorial",
		require "weeks.week1",
		require "weeks.week2",
		require "weeks.week3",
		require "weeks.week4",
		require "weeks.week5",
		require "weeks.whitty"
	}
	
	-- Screen init
	lovesize.set(1280, 720)
	
	-- Variables
	font = love.graphics.newFont("fonts/vcr.ttf", 24)
	isLoading = false
	
	weekNum = 1
	songDifficulty = 2
	
	spriteTimers = {
		0, -- Girlfriend
		0, -- Enemy
		0 -- Boyfriend
	}
	
	cam = {x = 0, y = 0, sizeX = 0.9, sizeY = 0.9}
	camScale = {x = 0.9, y = 0.9}
	uiScale = {x = 0.7, y = 0.7}
	
	musicTime = 0
	health = 0
	
	Gamestate.switch(menu)
end

function love.resize(width, height)
	lovesize.resize(width, height)
end

function love.update(dt)
	dt = math.min(dt, 1 / 30)
	
	input:update()
	
	Gamestate.update(dt)
	
	Timer.update(dt)
end

function love.draw()
	local loveWidth = lovesize.getWidth()
	local loveHeight = lovesize.getHeight()
	
	love.graphics.setFont(font)
	
	lovesize.begin()
		graphics.setColor(1, 1, 1) -- Fade effect on
		Gamestate.draw()
		love.graphics.setColor(1, 1, 1) -- Fade effect off
		
		if isLoading then
			love.graphics.print("Loading...", loveWidth - 175, loveHeight - 50)
		end
	lovesize.finish()
	
	-- Debug output
	if settings.showDebug then
		local debugStr
		
		if settings.showDebug == "detailed" then
			debugStr = "FPS: " .. tostring(love.timer.getFPS()) ..
			"\nLUA MEM USAGE (KB): " .. tostring(math.floor(collectgarbage("count"))) ..
			"\nGRAPHICS MEM USAGE (MB): " .. tostring(math.floor(love.graphics.getStats().texturememory / 1048576)) ..
			
			"\n\nmusicTime: " .. tostring(math.floor(musicTime)) ..  -- Floored for readability
			"\nhealth: " .. tostring(health)
		else
			debugStr = "FPS: " .. tostring(love.timer.getFPS())
		end
		
		love.graphics.print(debugStr, 5, 5, nil, 0.5, 0.5)
	end
end
