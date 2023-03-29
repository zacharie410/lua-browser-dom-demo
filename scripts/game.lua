local js = require('js')
local document = js.global.document

-- Define a function to run when the DOM is loaded
local function onDOMLoaded()
    --
    local canvas = document:createElement("canvas")
    canvas.width = 400
    canvas.height = 300
    -- Set the canvas element's style to center it on the screen
    canvas.style.margin = "auto"
    canvas.style.display = "block"
    canvas.style["background-color"]="lightblue"

    document.body:appendChild(canvas)
    --
    local div = document:createElement("div")
    local button = document:createElement("button")
    button.textContent = "Start Demo Game"
    button.style.width = "400px"
    button.style.margin = "auto"

    div:appendChild(button)
    document.body:appendChild(div)
    --
    local highscore = js.global.window.localStorage:getItem("highscore")
    if not highscore or tostring(highscore) == "null" then
        highscore = 0
    end


    local paused = false

    -- Get the 2D context of the canvas
    local ctx = canvas:getContext("2d")

    -- Define the player object
    local player = {
        x = canvas.width / 2,
        y = canvas.height - 50,
        width = 32,
        height = 32,
        image = document:createElement("img"),
        score = 0,
    }
    player.image.src = "player.png"

    -- Define the item object
    local item = {
        x = math.random(canvas.width - 32),
        y = -32,
        width = 32,
        height = 32,
        image = document:createElement("img")
    }
    item.image.src = "item.png"

    -- Add event listeners for arrow key presses
    document:addEventListener("keydown", function(_, key)
        if key.keyCode == 37 then -- Left arrow key
            player.x = math.max(player.x - 10, 0)
        elseif key.keyCode == 39 then -- Right arrow key
            player.x = math.min(378, player.x + 10)
        end
    end)

    -- Define the game loop function
    local function gameLoop()
        if paused then
            return js.global:requestAnimationFrame(gameLoop)
        end
        -- Clear the canvas
        ctx:clearRect(0, 0, canvas.width, canvas.height)

        -- Draw the player sprite at its current position
        ctx:drawImage(player.image, player.x, player.y)

        -- Draw the item sprite at its current position
        ctx:drawImage(item.image, item.x, item.y)

        -- Update the position of the item
        item.y = item.y + 5
        if item.y > canvas.height then
            item.x = math.random(canvas.width - 32)
            item.y = -32
            player.score = player.score + 1
            if player.score > tonumber(highscore) then
                highscore = player.score
                js.global.window.localStorage:setItem("highscore", player.score)
            end
        end

        -- Check for collision between the player and the item
        if player.x < item.x + item.width and
           player.x + player.width > item.x and
           player.y < item.y + item.height and
           player.y + player.height > item.y then
            item.x = math.random(canvas.width - 32)
            item.y = -32
            player.score = 0
            paused = true
            
        end
        -- Draw the score text
        ctx.fillStyle = "black"
        ctx.font = "20px Arial"
        ctx:fillText("Score: " .. player.score, 10, 25)

        ctx.fillStyle = "gold"
        ctx.font = "25px Arial"
        ctx:fillText("High Score: " .. highscore, 10, 50)
        -- Schedule the next frame
        js.global:requestAnimationFrame(gameLoop)
    end

    -- Start the game loop
    gameLoop()

    button:addEventListener("click", function()
        paused = false
    end)
end

-- Check if the DOM has already loaded
if document.readyState == "loading" then
    -- If the DOM is still loading, wait for the DOMContentLoaded event
    document:addEventListener("DOMContentLoaded", onDOMLoaded)
else
    -- If the DOM has already loaded, run the function immediately
    onDOMLoaded()
end
