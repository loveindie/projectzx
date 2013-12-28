
bullet = {}
bullet.speed = 500

function bulletDraw()
	for i, v in ipairs(bullet) do
		if v.id == true then
			love.graphics.setColor( 0, 0, 0 )
			love.graphics.circle( "fill", v.x, v.y, v.r )
		end
	end
end

function bulletUpdate(dt)
	for i, v in ipairs(bullet) do 
		if v.id == true then
			v.x = v.x + v.dx * dt
			v.y = v.y + v.dy * dt
		else
			v.x = nil
			v.y = nil
			v.r = nil
		end
	end
end

function bulletSpawn( x, y )
	mouseX = x
	mouseY = y
	
	startX = player1.x
	startY = player1.y
	
	dir = math.atan2(( mouseY - player1.y ), ( mouseX - player1.x ))
	
	bulletDx = bullet.speed * math.cos(dir)
	bulletDy = bullet.speed * math.sin(dir)
	
	table.insert( bullet, { x = startX, y = startY, dx = bulletDx, dy = bulletDy, r = 2, id = true } )
end

function collideBullets() --note that bullet.x and bullet.y are located in the middle of the circle.
	for i, bullet in ipairs(bullet) do
		for ii, bot1 in ipairs(bot1) do
			if bullet.id == true then
				if bullet.x + bullet.r > enemiesA and
				bullet.x - bullet.r < enemiesB and
				bullet.y + bullet.r > enemiesA and
				bullet.y - bullet.r < enemiesC then
					print("hit!")
					bullet.id = false
					bot1.id = false
				end
			end
		end
	end
end





























--[[
function bulletLoad()

   -- setup the bullets
   bullets = {}

   -- setup the bot1
   bot1 = {}

   for i=0,7 do
      enemy = {}
      enemy.width = 40
      enemy.height = 20
      enemy.speed = 20
      enemy.x = i * (enemy.width+60) + 100
      enemy.y = enemy.height + 100
      table.insert(bot1, enemy)
   end
   
   -- when a key is pressed, call the function love.keypressed
  love.keypressed()
end


function bulletUpdate(dt)
 
   
   -- update the position of the bullets in the table 'bullets'
   for i,v in ipairs(bullets) do
      
      -- move the bullets upward
      v.y = v.y - v.speed * dt

      
      -- Check for collision between bullets and bot1. If they collide, remove both bullets and emies
      for ii,vv in ipairs(bot1) do
         if v.y < vv.y and (v.x > vv.x and v.x < vv.x+vv.width) then
            table.remove(bot1, ii)
            table.remove(bullets, i)
         end
      end

      -- remove shots that are out of range
       if v.y < 120 then
         table.remove(bullets, i)
      end

   end

end




function bulletDraw()
   

  
   -- draw the bullets
   love.graphics.setColor(255, 255, 255)
   for i, v in ipairs(bullets) do
      love.graphics.rectangle("fill", v.x, v.y, v.width, v.height)
   end

   -- draw the bot1
   love.graphics.setColor(0, 255, 255)
   for i, v in ipairs(bot1) do
      love.graphics.rectangle("fill", v.x, v.y, v.width, v.height)
   end

end



function love.keypressed(key)
   if key == " " then
   print("ggglglhbj.kj")
       -- shoot a bullet (by adding it to the bullets table and passing a .y value)
      bullets[#bullets+1] = {
      y = 495,
	  
      speed = 300,
      width = 10,
      height = 5,
      x = (player1.x + player1.width/2) - 5
      }
   end
end   

function CheckCollision(ax1,ay1,aw,ah, bx1,by1,bw,bh)

  local ax2,ay2,bx2,by2 = ax1 + aw, ay1 + ah, bx1 + bw, by1 + bh
  return ax1 <  bx2 and ax2 < bx1 and ay1 < by2 and ay2 < by1
end



]]--
















--[[
function bulletLoad()
bullet = {}
bulletSpeed = 10

end


function bulletSpwan(x, y, dir) --- dir 
	table.insert(bullet, {width = 10, height = 10, x = x, y = y, dir = dir})
end

function bulletDraw()
	for i,v in ipairs(bullet) do
		love.graphics.setColor(51, 255, 102)
	love.graphics.rectangle('fill', v.x, v.y, v.width, v.height)
   -- love.graphics.circle("fill",)

	end
end

function bulletUpdate(dt)
	for i,v in  ipairs(bullet) do
		if v.dir =="right" then
			v.x = v.x + bulletSpeed *dt
			end
			
			if v.dir =="left" then
			v.y = v.y - bulletSpeed *dt
			end
			
			if v.dir =="up" then
			v.x = v.x + bulletSpeed *dt
			end
			
			if v.dir =="down" then
			v.x = v.x - bulletSpeed *dt
			end
		end
end		



function  bulletShoot(key)

	if key == " " then
		bulletSpwan( player1.x + player1.width, player1.y + player1.height / 2, "right" )
		print("shoot with spacebar")
	end
	
	
	if key == "left" then
		bulletSpwan(player1.x + player1.width, player1.y + player1.height / 2, 'left')
	end
	
	if love.keyboard.isDown("right") then
		bulletSpwan( player1.x + player1.width, player1.y + player1.height / 2, "right" )
	   print("shoot")
	end
end

]]--