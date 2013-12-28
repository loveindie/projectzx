require "map"
require"bullet"
function playerLoad()


    player1 = {}
	
	 player1.body = love.physics.newBody(world, 200, 550, "dynamic")
     player1.body:setMass(100) -- make it pretty light
	 player1.shape = love.physics.newRectangleShape(0, 0, 30, 15)
	 player1.fixture = love.physics.newFixture(player1.body, player1.shape, 2) 
	 player1.fixture:setRestitution(0.5)  
     player1.speed = 32
	 player1.health = 100
	 player1.damage = 2	
	 
    	 mapLoad()
    
    bullets = {}
         bulletSpeed = 250


	
end
function playerUpdate(dt)

	------ Boost controls for player------
	if love.keyboard.isDown("right") and love.keyboard.isDown("x")  then 
	
	      player1.body:applyForce(100, 0.5)
		   print("boost right")
	elseif  love.keyboard.isDown("left") and love.keyboard.isDown("x") then 
	
   		  player1.body:applyForce(-100, 0.5)
           print("boost left")  
    end
		
		------ controls for player------

    if love.keyboard.isDown("right") then
       player1.body:applyForce(100, 0.0)
	   print("moving right")
    elseif love.keyboard.isDown("left") then
			player1.body:applyForce(-100, 0.0)
			print("moving left")
		end
		if love.keyboard.isDown("up") then
			player1.body:applyForce(0, -100)
		elseif love.keyboard.isDown("down") then
			player1.body:applyForce(0, 100)
    end
	
		for i,v in ipairs(bullets) do
        v.x = v.x + (v.dx * dt)
        v.y = v.y + (v.dy * dt)
    end	
			

end
function playerDraw()
	
	love.graphics.setColor(40, 215, 198, 255) -- set the drawing color to blue for player 1
    love.graphics.polygon("fill", player1.body:getWorldPoints(player1.shape:getPoints())) 
	
	 love.graphics.setColor(255, 255, 255)
    for i,v in ipairs(bullets) do
        love.graphics.circle("fill", v.x, v.y, 3)
    end
end




function love.mousepressed(x, y, button)
    if button == "l" then
        local startX = player1.x + player1.width / 2
        local startY = player1.y + player1.height / 2
        local mouseX = x
        local mouseY = y
        
        local angle = math.atan2((mouseY - startY), (mouseX - startX))
        
        local bulletDx = bulletSpeed * math.cos(angle)
        local bulletDy = bulletSpeed * math.sin(angle)
        
        table.insert(bullets, {x = startX, y = startY, dx = bulletDx, dy = bulletDy})
    end
end


