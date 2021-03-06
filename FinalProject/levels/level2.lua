EnemySpawner = require("EnemySpawner")
require("TopGUI")

-- start at 0
--
local levelState = -1
local enemySpawned = false

local titleY = 400
local titleOpac = 1

local T = {}


function T.update(dt, projectiles, player)


  if(global.levelReset) then
    EnemySpawner.reset()
    levelState = 0
    timeMove = true
    time = 0
    global.levelReset = false

  end

  if(levelState == -1) then
    global.backgroundMusic:pause()
    global.LevelMusic:play()
    levelState = 0
  end

  if(global.gameOver) then
    EnemySpawner.reset()
    levelState = -1
    global.gameState = 0
    global.gameOver = false
    global.LevelMusic:pause()
    global.backgroundMusic:play()
  end

  if(#EnemySpawner.EnemyGroup1 == 0) then
    enemySpawned = false
  end

  if(levelState == 0) then
    player.x = 300
    player.y = 700
    levelState = 1
    global.canEscape = false
    enemySpawned = false
  elseif(levelState == 1 and enemySpawned == false) then
    TopGUI.levelGUIInfo(2)
    EnemySpawner.spawnEnemies(5, 1, 2, 1)
    EnemySpawner.spawnEnemies(5, 1, 3, 1)
    enemySpawned = true
    levelState = 2
  elseif(levelState == 2 and enemySpawned == false) then
    EnemySpawner.spawnEnemies(3, 2, 4, 1)
    EnemySpawner.spawnEnemies(3, 2, 5, 1)
    enemySpawned = true
    levelState = 3
  elseif(levelState == 3 and enemySpawned == false) then
    EnemySpawner.spawnEnemies(5, 1, 6, 1)
    EnemySpawner.spawnEnemies(5, 1, 7, 1)
    enemySpawned = true
    levelState = 4
  elseif(levelState == 4 and enemySpawned == false) then
    EnemySpawner.spawnEnemies(2, 8, 9, 1)
    EnemySpawner.spawnEnemies(2, 8, 8, 1)
    enemySpawned = true
    levelState = 5
  elseif(levelState == 5 and enemySpawned == false) then
    EnemySpawner.spawnEnemies(6, 5, 3, 1)
    EnemySpawner.spawnEnemies(6, 5, 3, 1)
    enemySpawned = true
    levelState = 6
  elseif(levelState == 6 and enemySpawned == false) then
    EnemySpawner.spawnEnemies(10, 1, 12, 1)
    EnemySpawner.spawnEnemies(10, 1, 12, 1)
    enemySpawned = true
    levelState = 7
  elseif(levelState == 7 and enemySpawned == false) then
    EnemySpawner.spawnEnemies(2, 7, 3, 1)
    EnemySpawner.spawnEnemies(2, 7, 3, 1)
    enemySpawned = true
    levelState = 8
  elseif(levelState == 8 and enemySpawned == false) then
    EnemySpawner.spawnEnemies(3, 4, 7, 1)
    EnemySpawner.spawnEnemies(5, 6, 8, 1)
    enemySpawned = true
    levelState = 9
  elseif(levelState == 9 and enemySpawned == false) then
    EnemySpawner.spawnEnemies(4, 3, 9, 1)
    EnemySpawner.spawnEnemies(7, 4, 6, 1)
    enemySpawned = trued
    levelState = 10
  elseif(levelState == 10 and enemySpawned == false) then
    EnemySpawner.spawnEnemies(2, 8, 6, 1)
    EnemySpawner.spawnEnemies(7, 1, 12, 1)
    enemySpawned = true
    levelState = 11
  elseif(levelState == 11 and enemySpawned == false) then
    EnemySpawner.reset()
    global.gameState = 13
    player.lives = player.lives + 1
    TopGUI.livesGUIInfo(player.lives)
    TopGUI.levelGUIInfo(3)
    levelState = - 1
  end



  EnemySpawner.update(dt, projectiles)
end



 function T.draw()

   love.graphics.setNewFont("asests/AmericanCaptain.ttf", 64)

   if(titleY > 100) then
     love.graphics.setColor(.5,1,.5,titleOpac)
     love.graphics.print("Level 2", 275, titleY)
    end

   love.graphics.setColor(1,1,1,1)
   titleY = titleY - 1.5
   titleOpac = titleOpac - .005

   EnemySpawner.draw()
end

return T
