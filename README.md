# 1. Lua Browser DOM Demo
This repository showcases a simple Lua script that uses the DOM (Document Object Model) API to manipulate the HTML page in the browser. The script can be run in any modern web browser that supports the Lua scripting language.

### Table of Contents

- [1. Lua Browser DOM Demo](#1-lua-browser-dom-demo)
    - [Table of Contents](#table-of-contents)
  - [1.1. Running the Demo](#11-running-the-demo)
  - [1.2. Background](#12-background)
  - [1.3. Demo 1: Overview (script.lua)](#13-demo-1-overview-scriptlua)
  - [1.4. Demo 2: Canvas Game (game.lua)](#14-demo-2-canvas-game-gamelua)
    - [1.4.1. Controls](#141-controls)
    - [1.4.2. Scoring](#142-scoring)
    - [1.4.3. High Score](#143-high-score)
  - [1.5. Dependencies](#15-dependencies)
  - [1.6. License](#16-license)


## 1.1. Running the Demo
You can try the demo live [here](https://zacharie410.github.io/lua-browser-dom-demo/) or you can clone the repository and run it locally:

1. Clone the repository: git clone `https://github.com/zacharie410/lua-browser-dom-demo.git`
2. Open the `index.html` file in a web browser.
3. The script is included in the file and will be executed automatically when the page loads.

## 1.2. Background
Lua is a powerful scripting language that has been around since the mid-1990s. It was originally designed to be a lightweight language for extending software applications, but it has since been used for a wide variety of purposes, including game development, web development, and general-purpose scripting.

One interesting fact about Lua is that it was actually considered as a replacement for JavaScript in web browsers at one point. The Lua scripting engine was designed to be embedded in web browsers, and it was proposed as a replacement for JavaScript due to its speed, simplicity, and flexibility. However, JavaScript ultimately won out due to its widespread adoption and support.

Despite this, Lua remains a popular language among developers due to its ease of use and versatility. Its syntax is easy to learn and understand, making it accessible to both experienced and novice developers alike. Additionally, its lightweight design and minimal memory footprint make it ideal for use in embedded systems and other resource-constrained environments.

Overall, Lua is a great choice for anyone looking for a powerful, easy-to-use scripting language. Whether you are developing games, building web applications, or working on other projects, Lua offers a flexible and efficient way to get the job done.

## 1.3. Demo 1: Overview (script.lua)
The script creates a new `div` element and appends it to the body of the HTML document. The text content of the `div` element is initially set to "Hello from Lua!".

A new `button` element is also created and appended to the `div`. When the button is clicked, the text content of the `div` is changed to "You clicked the button!".

The script uses the `DOMContentLoaded` event to ensure that the DOM is fully loaded before manipulating it. If the DOM is still loading, the `onDOMLoaded` function is registered as an event listener for the `DOMContentLoaded` event. Otherwise, the `onDOMLoaded` function is executed immediately.

## 1.4. Demo 2: Canvas Game (game.lua)
The second demo is a simple game that uses the HTML5 canvas element to draw graphics and handle user input. The game involves moving a player object horizontally to dodge falling items, and keeping track of the player's score and high score.

### 1.4.1. Controls
Use the left and right arrow keys to move the player object.

### 1.4.2. Scoring
The player's score increases by 1 each time they successfully dodge an item. If the player collides with an item, their score is reset to 0 and the game is paused until the "Start Demo Game" button is clicked again.

### 1.4.3. High Score
The game also keeps track of the player's high score using local storage. The high score is displayed on the canvas. This is stored in `localStorage`

## 1.5. Dependencies
The script uses the `fengari` library, which provides access to the DOM API in Lua. The library is included in the `cdn.jsdelivr.net/npm/fengari-web@latest/dist/fengari-web.min.js` file, which is loaded in the index.html file.

## 1.6. License
This project is licensed under the MIT License
