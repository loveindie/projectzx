--require"bot"
require"map"
require"player"
function motherLoad()

 mother = {}
	
	 mother.body = love.physics.newBody(world, 590, 200, "dynamic")
     mother.body:setMass(100) -- make it pretty light
	 mother.shape = love.physics.newRectangleShape(0, 0, 35, 35)
	 mother.fixture = love.physics.newFixture(mother.body, mother.shape, 2) 
	 mother.fixture:setRestitution(0.5)  
     mother.speed = 32
	 mother.health = 100
	 mother.damage = 2	
    	 
	
	
	
end

function motherUpdate(dt)


	
if player1.body:getY() < mother.body:getY() then
		mother.body:setY( mother.body:getY() + 1 * dt) 
	end
	if player1.body:getY() > mother.body:getY() then
		mother.body:setY(mother.body:getY() - 1 * dt)
	end
	if player1.body:getX() < mother.body:getX() then
		mother.body:setX(mother.body:getX() + 1 * dt)
	end
	if player1.body:getX() > mother.body:getX() then
		mother.body:setX(mother.body:getX() - 1 * dt) 
	end
	
	


	motherPhysics(dt)
end

function motherDraw()

     love.graphics.setColor(205, 92, 92) -- set the drawing color to indianred for mother for testing 
    --love.graphics.setColor(40, 215, 198, 255) -- set the drawing color to blue for mother
    love.graphics.polygon("fill", mother.body:getWorldPoints(mother.shape:getPoints())) 
	
end

function motherPhysics(dt)


end



