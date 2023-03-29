local js = require('js')
local document = js.global.document

-- Define a function to run when the DOM is loaded
local function onDOMLoaded()
    -- Create a new div element and append it to the body
    local div = document:createElement("div")
    document.body:appendChild(div)

    -- Set the text content of the div element
    div.textContent = "Hello from Lua!"

    -- Create a new button element and append it to the div
    local button = document:createElement("button")
    button.textContent = "Click me!"
    div:appendChild(button)

    -- Add a click event listener to the button
    button:addEventListener("click", function()
        -- Change the text content of the div when the button is clicked
        div.textContent = "You clicked the button!"
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
