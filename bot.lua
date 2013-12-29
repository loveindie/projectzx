require"player"
require"mom"
function botLoad()
		--world = love.physics.newWorld(0, 0, true)  --Gravity is being set to 0 in the x direction and 0 in the y direction.
	
	bot1 = {}
	 bot1.body = love.physics.newBody(world, 450, 200, "dynamic")
     bot1.body:setMass(100) -- make it pretty light
	 bot1.shape = love.physics.newRectangleShape(0, 0, 10, 10)
	 bot1.fixture = love.physics.newFixture(bot1.body, bot1.shape, 2) 
	 bot1.fixture:setRestitution(0.5)  
     bot1.speed = 45
	 bot1.health = 10
	 bot1.damage = 2	

	bot2 = {}
	 bot2.body = love.physics.newBody(world, 500, 200, "dynamic")
     bot2.body:setMass(100) -- make it pretty light
	 bot2.shape = love.physics.newRectangleShape(0, 0, 15, 15)
	 bot2.fixture = love.physics.newFixture(bot2.body, bot2.shape, 2) 
	 bot2.fixture:setRestitution(0.5)  
     bot2.speed = 50
	 bot2.health = 25
	 bot2.damage = 10	
	 bot2.actX = 500
	 bot2.actY = 200
	
	bot3 = {}
     bot3.body = love.physics.newBody(world, 550, 200, "dynamic")
     bot3.body:setMass(100) -- make it pretty light
	 bot3.shape = love.physics.newRectangleShape(0, 0, 20, 20)
	 bot3.fixture = love.physics.newFixture(bot3.body, bot3.shape, 2) 
	 bot3.fixture:setRestitution(0.5)  
     bot3.speed = 55
	 bot3.health = 45
	 bot3.damage = 20	
	 	
	--mike: this is the spawning of the children	
	botChildren = {}
	for i = 1, 5 do
		botChildren[i] = {}
		botChildren[i].body = love.physics.newBody(world, mother.body:getX(), mother.body:getY(), "dynamic")
		botChildren[i].body:setMass(100) -- make it pretty light
		botChildren[i].shape = love.physics.newRectangleShape(0, 0, 10, 10)
		botChildren[i].fixture = love.physics.newFixture(botChildren[i].body, botChildren[i].shape, 2) 
		botChildren[i].fixture:setRestitution(0.5)  
		botChildren[i].speed = 45
		botChildren[i].health = 10
		botChildren[i].damage = 2
	end
	
	--[[ 
	block1 = {}
	block1.body = love.physics.newBody(world, 200,200,'dynamic')
	block1.shape = love.physics.newRectangleShape(0,0,50,100)
	block1.fixture = love.physics.newFixture(block1.body, block1.shape, 5)
	]]--
end

--[[function createBotChildren()
botChildren = {}
	for i = 1, 5 do
		botChildren[i] = {}
		botChildren[i].body = love.physics.newBody(world, mother.body:getX(), mother.body:getY(), "dynamic")
		botChildren[i].body:setMass(100) -- make it pretty light
		botChildren[i].shape = love.physics.newRectangleShape(0, 0, 10, 10)
		botChildren[i].fixture = love.physics.newFixture(botChildren[i].body, botChildren[i].shape, 2) 
		botChildren[i].fixture:setRestitution(0.5)  
		botChildren[i].speed = 45
		botChildren[i].health = 10
		botChildren[i].damage = 2
	end
end]]--

function botUpdate(dt)	
	if player1.body:getY() > bot1.body:getY() then
		bot1.body:setY( bot1.body:getY() + 20 * dt) 
	end
	if player1.body:getY() < bot1.body:getY() then
		bot1.body:setY(bot1.body:getY() - 20 * dt)
	end
	if player1.body:getX() > bot1.body:getX() then
		bot1.body:setX(bot1.body:getX() + 20 * dt)
	end
	if player1.body:getX() < bot1.body:getX() then
		bot1.body:setX(bot1.body:getX() - 20 * dt) 
	end
	
	
	if player1.body:getY() > bot2.body:getY() then
		bot2.body:setY( bot2.body:getY() + 15 * dt) 
	end
	if player1.body:getY() < bot2.body:getY() then
		bot2.body:setY(bot2.body:getY() - 15 * dt)
	end
	if player1.body:getX() > bot2.body:getX() then
		bot2.body:setX(bot2.body:getX() + 15 * dt)
	end
	if player1.body:getX() < bot2.body:getX() then
		bot2.body:setX(bot2.body:getX() - 15 * dt) 
	end
	
	
	if player1.body:getY() > bot3.body:getY() then
		bot3.body:setY( bot3.body:getY() + 10 * dt) 
	end
	if player1.body:getY() < bot3.body:getY() then
		bot3.body:setY(bot3.body:getY() - 10 * dt)
	end
	if player1.body:getX() > bot3.body:getX() then
		bot3.body:setX(bot3.body:getX() + 10 * dt)
	end
	if player1.body:getX() < bot3.body:getX() then
		bot3.body:setX(bot3.body:getX() - 10 * dt) 
	end
	
	--mike: this controls the movements for each child
	for i, botChild in ipairs(botChildren) do
		if player1.body:getY() > botChild.body:getY() then
			botChild.body:setY( botChild.body:getY() + 20 * dt) 
		end
		if player1.body:getY() < botChild.body:getY() then
			botChild.body:setY(botChild.body:getY() - 20 * dt)
		end
		if player1.body:getX() > botChild.body:getX() then
			botChild.body:setX(botChild.body:getX() + 20 * dt)
		end
		if player1.body:getX() < botChild.body:getX() then
			botChild.body:setX(botChild.body:getX() - 20 * dt) 
		end
	end
end

function botDraw()
	--Bot one
	love.graphics.setColor(51, 255, 204) -- set the drawing color to turquoise for bot1
    love.graphics.polygon("fill", bot1.body:getWorldPoints(bot1.shape:getPoints()))
	--Bot two
	love.graphics.setColor(51, 255, 102) -- set the drawing color to greenisg blue for the bot2
    love.graphics.polygon("fill", bot2.body:getWorldPoints(bot2.shape:getPoints()))
	--Bot three
	love.graphics.setColor(102, 255, 51) -- set the drawing color to green for the bot3
    love.graphics.polygon("fill", bot3.body:getWorldPoints(bot3.shape:getPoints()))
	
	--mike: this colors each child
	for i, botChild in ipairs(botChildren) do
		love.graphics.setColor(51, 255, 204) -- set the drawing color to turquoise for botChild
		love.graphics.polygon("fill", botChild.body:getWorldPoints(botChild.shape:getPoints()))
	end
end

--[[botChildren = {}
function botChildren()
	for i = 1, 5 do
		botChildren[i] = {}
		botChildren[i].body = love.physics.newBody(world, mother.body:getX(), mother.body:getY(), "dynamic")
		botChildren[i].body:setMass(100) -- make it pretty light
		botChildren[i].shape = love.physics.newRectangleShape(0, 0, 10, 10)
		botChildren[i].fixture = love.physics.newFixture(botChildren[i].body, botChildren[i].shape, 2) 
		botChildren[i].fixture:setRestitution(0.5)  
		botChildren[i].speed = 45
		botChildren[i].health = 10
		botChildren[i].damage = 2
	end
end]]--

--[[function spawnbot1()
    for i=1,100 do --Replace 10 with number of enemies you want
        bot1[#bot1+1]={
        x = mother.body:getX(),
        y = mother.body:getY(),
        }
    end
end]]--

--[[function botChildren:init()
   self.timer = 0
   self.spawnTime = 3
end

function botChildren:update( dt )
   self.timer = self.timer + dt
   if self.timer > self.spawnTime then
     botChildren()  -- his code
      self.timer = 0
	  print("spawn")
   end

        -- update anything else enemy related here
end]]--