require"bot"
require"map"
require"menu"
require"mom"
require"physics"
require"player"
require"audio"
--require"bullet"

function love.load()  --Everything is being loaded in to a new world with gravity set to 0,0
	world = love.physics.newWorld(0, 0, true)  --Gravity is being set to 0 in the x direction and 0 in the y direction.
    medium = love.graphics.newFont(45)--this is the font for the game 
	
   	gameState = "menu"

	-----MenuButtons----
	menuButton_spawn(350, 200, "Start", "start") 
    menuButton_spawn(350, 250, "Save", "save") 
    menuButton_spawn(350, 300, "Options", "options") 
	menuButton_spawn(350, 350, "Credit", "credit") 
	menuButton_spawn(350, 400, "Quit", "quit") 
	
     menuLoad()
	 motherLoad()
     botLoad() 
     --mapLoad()
     playerLoad()
	 --motherLoad()
	 physicsLoad()
	-- bulletLoad()
	 audioLoad()
		

end

function love.update(dt) -- Update
	if gameState == "playing"  then
	
		world:update(dt)		
		menuUpdate(dt)
		motherUpdate(dt)
		botUpdate(dt)
	--	mapUpdate(dt)
		--motherUpdate(dt)
		physicsUpdate(dt)
		playerUpdate(dt)
       -- bulletUpdate(dt)
	  --createBotChildren(dt)
	  --botChildren:update(dt)

	   end
			 if gameState == "menu" then 
			 menuUpdate(dt)
			end
	end


function love.draw() -- draw

	if gameState == "playing"  then
		motherDraw()
		botDraw()
		playerDraw()
		--motherDraw()
		--bulletDraw()
	end

	 if gameState == "menu" then 
			menuButton_draw()

			
	   end
end




-----Call backs----

 if gameState == "playing" and love.keyboard.isDown("p") then 
	 pauseMenu_draw()
	 love.graphics.setColor( 40, 215, 198, 255 ) --color of the bottomWall
	 love.graphics.polygon("line",  pauseMenu.body:getWorldPoints(pauseMenu.shape:getPoints()))
	 
	 end



    
function love.focus(bool)
    -- this well soon be a pause function
 	if bool == true then
		print("in game")
	else
		print("out of game")
	end
	end



function love.keypressed(key, unicode)

	 print(key, x, y, unicode)

end
function love.keyreleased(key, x, y, unicode)

	 print(key, x, y, unicode)

end


function love.mousepressed ( x, y)
	print(key, x, y, unicode)
		 
	if gameState == "menu" then
		menuButton_click(x, y )
	end
	
	 if gameState == "playing" and love.keyboard.isDown("p") then 
		pauseMenu_click(x, y)
	end
end

function love.mousereleased (key, x, y)
	 print(key, x, y, unicode)

end

function love.quit()
--This will be printed to the console on quit
  print("Thanks for playing. Please play again soon!")
end
  



