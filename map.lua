function mapLoad()
		  
				---------walls----of the game-----

	objects = {}	

	objects.static = {}

			objects.static.s = love.graphics.getWidth()
			objects.static.s = love.graphics.getHeight()
			objects.static.b = love.physics.newBody(world, 800/2,590, "static") -- "static" makes it not move
			objects.static.s = love.physics.newRectangleShape(790,20)         -- set size to 790,5 (x,y)
			objects.static.f = love.physics.newFixture(objects.static.b, objects.static.s)
			objects.static.f:setUserData("bottomWall")
  
	objects.static2 = {}
			objects.static2.s = love.graphics.getWidth()
			objects.static2.s = love.graphics.getHeight()
			objects.static2.b = love.physics.newBody(world, 800/2,10, "static") -- "static" makes it not move
			objects.static2.s = love.physics.newRectangleShape(790,5)         -- set size to 790,5 (x,y)
			objects.static2.f = love.physics.newFixture(objects.static2.b, objects.static2.s)
			objects.static2.f:setUserData("topWall")

	objects.staticL = {}
			objects.staticL.s = love.graphics.getWidth()
			objects.staticL.s = love.graphics.getHeight()
			objects.staticL.b = love.physics.newBody(world, 10,590/2, "static") -- "static" makes it not move
			objects.staticL.s = love.physics.newRectangleShape(5,570)         -- set size to 5,570 (x,y)
			objects.staticL.f = love.physics.newFixture(objects.staticL.b, objects.staticL.s)
			objects.staticL.f:setUserData("leftWall")

	objects.staticR = {}
			objects.staticR.s = love.graphics.getWidth()
			objects.staticR.s = love.graphics.getHeight()
			objects.staticR.b = love.physics.newBody(world, 795,599/2, "static") -- "static" makes it not move
			objects.staticR.s = love.physics.newRectangleShape(5,570)         -- set size to 5,570 (x,y)
			objects.staticR.f = love.physics.newFixture(objects.staticR.b, objects.staticR.s)
			objects.staticR.f:setUserData("rightWall")
			


			
end

function mapUpdate(dt)

end

function mapDraw()

		
		 love.graphics.setColor(255, 255, 255, 255) --colors for time/life
		 love.graphics.print("Time/Life: ", 41,585, 0, 1, 1) -- displaying time/life
				
			 ------------walls-------------
		 love.graphics.setColor( 40, 215, 198, 255 ) --color of the bottomWall
		 love.graphics.polygon("line", objects.static.b:getWorldPoints(objects.static.s:getPoints()))
			 
		 love.graphics.setColor( 100, 15, 198, 255 )--color of the topWall
		 love.graphics.polygon("fill", objects.static2.b:getWorldPoints(objects.static2.s:getPoints()))

		 love.graphics.setColor( 109, 15, 98, 255 )--color of the leftWall
		 love.graphics.polygon("fill", objects.staticL.b:getWorldPoints(objects.staticL.s:getPoints()))

		 love.graphics.setColor( 170, 5, 18, 155 )--color of the rightWall
		 love.graphics.polygon("fill", objects.staticR.b:getWorldPoints(objects.staticR.s:getPoints()))
		 


end






function CheckCollision(ax1,ay1,aw,ah, bx1,by1,bw,bh)

  local ax2,ay2,bx2,by2 = ax1 + aw, ay1 + ah, bx1 + bw, by1 + bh
  return ax1 < bx2 and ax2 > bx1 and ay1 < by2 and ay2 > by1
end
