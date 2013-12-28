
	menuButton = {}


	
function menuButton_spawn(x, y, text, id)

	table.insert(menuButton, {x = x, y = y, text =  text, id = id})

end
function menuLoad()
	gameState = "menu"

-----MenuButtons----
	menuButton_spawn(350, 200, "Start", "start") 
    menuButton_spawn(350, 250, "Save", "save") 
    menuButton_spawn(350, 300, "Options", "options") 
	menuButton_spawn(350, 350, "Credit", "credit") 
	menuButton_spawn(350, 400, "Quit", "quit") 
		gameState = "menu"

end
function menuUpdate(dt)
-----MenuButtons----
	menuButton_spawn(350, 200, "Start", "start") 
    menuButton_spawn(350, 250, "Save", "save") 
    menuButton_spawn(350, 300, "Options", "options") 
	menuButton_spawn(350, 350, "Credit", "credit") 
	menuButton_spawn(350, 400, "Quit", "quit") 
end

function menuButton_draw()

	for i,v in ipairs(menuButton) do
		love.graphics.setColor(40, 215, 198, 255)
		love.graphics.setFont(medium)
		love.graphics.print(v.text, v.x, v.y)


	end 

end

function menuButton_click(x, y)

	for i,v in ipairs(menuButton) do
		if x > v.x and 
		   x < v.x + medium:getWidth(v.text) and
		   
           y > v.y  and 
		   y < v.y  + medium:getHeight() then
		   
		   if v.id == "quit" then
		   love.event.push("quit")
		   end
		   if v.id == "start" then
		     gameState = "playing"
			end 
			 
         end		   
		end
	 end