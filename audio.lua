require"menu"
function audioLoad()

    if gameState == "menu" then 

	   music = love.audio.newSource("sounds/menuMusic.mp3", "stream")
       love.audio.setVolume(4.0)
       love.audio.play(music)
	 end
	
    if gameState == "playing"  then
	
 
	   musicInGame = love.audio.newSource("sounds/inGameMusic.mp3", "stream")
       love.audio.setVolume(4.0)
	   love.audio.play(musicInGame)
	   	       love.audio.stop(music)

	end
	
end


--[[
function playMusic()
       music = love.audio.newSource("sounds/menuMusic.mp3", "stream")
	  
       love.audio.setVolume(4.0)
       love.audio.play(music)
	   if gameState == "playing"  then
	

	end

end

function playMusicInGame()
	   musicInGame = love.audio.newSource("sounds/inGameMusic.mp3", "stream")
       love.audio.setVolume(4.0)
	   love.audio.play(musicInGame)
       	       love.audio.stop( music)

end
]]--