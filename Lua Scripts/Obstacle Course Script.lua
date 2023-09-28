-- Obstacle Course Game

-- Variables
local player = game.Players.LocalPlayer
local character = player.Character or player.CharacterAdded:Wait()
local humanoid = character:WaitForChild("Humanoid")
local torso = character:WaitForChild("Torso")
local obstacles = {} -- Table to store obstacle parts

-- Function to create an obstacle
local function createObstacle(position)
    local obstacle = Instance.new("Part")
    obstacle.Size = Vector3.new(5, 5, 5)
    obstacle.Anchored = true
    obstacle.BrickColor = BrickColor.new("Bright red")
    obstacle.Position = position
    obstacle.Parent = game.Workspace
    table.insert(obstacles, obstacle)
end

-- Function to move the character forward
local function moveForward()
    local forwardVector = torso.CFrame.lookVector
    character:SetPrimaryPartCFrame(torso.CFrame + forwardVector * 5)
end

-- Function to jump
local function jump()
    humanoid:Move(Vector3.new(0, 10, 0))
end

-- Main loop to create obstacles
for i = 1, 10 do
    createObstacle(Vector3.new(math.random(-50, 50), 2.5, i * 20))
end

-- Connect player input
player:GetMouse().Button1Down:Connect(function()
    moveForward()
end)

player:GetMouse().Button2Down:Connect(function()
    jump()
end)
