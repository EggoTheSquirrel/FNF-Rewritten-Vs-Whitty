--[[----------------------------------------------------------------------------
This file is part of Friday Night Funkin' Rewritten

Copyright (C) 2021  HTV04 --And EggoTheSquirrel!!!

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
local stageBack, stageFront, ballisticStage, ballisticEffect

return {
	enter = function(self)
		weeks:enter()

		if songNum == 3 then
			ballisticStage = love.filesystem.load("sprites/whitty/street-ballistic.lua")()
			ballisticEffect = Image(love.graphics.newImage(graphics.imagePath("whitty/red")))
			ballisticEffect.x, ballisticEffect.y = cam.x, cam.y

		else
			stageBack = Image(love.graphics.newImage(graphics.imagePath("whitty/street-back")))
			stageFront = Image(love.graphics.newImage(graphics.imagePath("whitty/street-front")))
			stageFront.y = 400
		end
		
		if songNum == 3 then
			enemy = love.filesystem.load("sprites/whitty/whitty-crazy.lua")()
			enemy.x, enemy.y = -450, -50
		else
			enemy = love.filesystem.load("sprites/whitty/whitty.lua")()
			enemy.x, enemy.y = -380, -50
		end

		girlfriend = love.filesystem.load("sprites/whitty/girlfriend-sway.lua")()
		girlfriend.x, girlfriend.y = 30, 0
		boyfriend.x, boyfriend.y = 260, 100
		
		if songNum == 3 then
			enemyIcon:animate("crazy whitty", false)
		else
			enemyIcon:animate("whitty", false)
		end

		self:load()
	end,
	
	load = function(self)
		weeks:load()
				
		if songNum == 3 then
			inst = love.audio.newSource("music/whitty/ballistic-inst.ogg", "stream")
			voices = love.audio.newSource("music/whitty/ballistic-voices.ogg", "stream")
		elseif songNum == 2 then
			inst = love.audio.newSource("music/whitty/overhead-inst.ogg", "stream")
			voices = love.audio.newSource("music/whitty/overhead-voices.ogg", "stream")
		else
			inst = love.audio.newSource("music/whitty/lo-fight-inst.ogg", "stream")
			voices = love.audio.newSource("music/whitty/lo-fight-voices.ogg", "stream")
		end
		
		self:initUI()
		
		inst:play()
		weeks:voicesPlay()
	end,
	
	initUI = function(self)
		weeks:initUI()
		
		if songNum == 3 then
			weeks:generateNotes(love.filesystem.load("charts/whitty/ballistic" .. songAppend .. ".lua")())
		elseif songNum == 2 then
			weeks:generateNotes(love.filesystem.load("charts/whitty/overhead" .. songAppend .. ".lua")())
		else
			weeks:generateNotes(love.filesystem.load("charts/whitty/lo-fight" .. songAppend .. ".lua")())
		end
	end,
	
	update = function(self, dt)
		if songNum == 3 then
			ballisticStage:update(dt)
						
			if ballisticStage.anim.name ~= "moving" then 
				ballisticStage:animate("moving", true)
			end
		end

		if gameOver then
			if not graphics.isFading then
				if input:pressed("confirm") then
					inst:stop()
					inst = love.audio.newSource("music/game-over-end.ogg", "stream")
					inst:play()
					
					Timer.clear()
					
					cam.x, cam.y = -boyfriend.x, -boyfriend.y
					
					boyfriend:animate("dead confirm", false)
					
					graphics.fadeOut(3, function() self:load() end)
				elseif input:pressed("gameBack") then
					graphics.fadeOut(0.5, function() Gamestate.switch(menu) end)
				end
			end
			
			boyfriend:update(dt)
			
			return
		end
		
		weeks:update(dt)

		if girlfriend.anim.name == "idle" then
			girlfriend.anim.speed = 6 / (60 / bpm)
		end

		if songNum == 3 and girlfriend.anim.name ~= "scared" then
			girlfriend:animate("scared", true)
		end
				
		if health >= 80 then
			if songNum == 3 and enemyIcon.anim.name == "crazy whitty" then
				enemyIcon:animate("crazy whitty losing", false)
			elseif enemyIcon.anim.name == "whitty" then
				enemyIcon:animate("whitty losing", false)
			end
		else
			if songNum == 3 and enemyIcon.anim.name == "crazy whitty losing" then
				enemyIcon:animate("crazy whitty", false)
			elseif enemyIcon.anim.name == "whitty losing" then
				enemyIcon:animate("whitty", false)
			end
		end
		
		if not graphics.isFading and not inst:isPlaying() and not voices:isPlaying() then
			if storyMode and songNum < 3 then
				songNum = songNum + 1
				
				self:load()
			else
				graphics.fadeOut(0.5, function() Gamestate.switch(menu) end)
			end
		end

		weeks:updateUI(dt)
	end,
	
	draw = function(self)
		weeks:draw()
		
		if gameOver then return end
		
		love.graphics.push()
			love.graphics.translate(lovesize.getWidth() / 2, lovesize.getHeight() / 2)
			love.graphics.scale(cam.sizeX, cam.sizeY)
			
			love.graphics.push()
				love.graphics.translate(cam.x * 0.9, cam.y * 0.9)
				
				if songNum == 3 then
					ballisticStage:draw()
					ballisticEffect:draw()
				else
					stageBack:draw()
					stageFront:draw()
				end

				girlfriend:draw()
			love.graphics.pop()
			love.graphics.push()
				love.graphics.translate(cam.x, cam.y)
				
				enemy:draw()
				boyfriend:draw()
			love.graphics.pop()
			love.graphics.push()
				love.graphics.translate(cam.x * 1.1, cam.y * 1.1)
				
			love.graphics.pop()
			weeks:drawRating(0.9)
		love.graphics.pop()
		
		weeks:drawUI()
	end,
	
	leave = function(self)
		stageBack = nil
		stageFront = nil
		ballisticStage = nil
		
		weeks:leave()
	end
}
