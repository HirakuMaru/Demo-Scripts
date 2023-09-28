-- Coin Collector Game

-- Variables
local player = game.Players.LocalPlayer
local playerGui = player:WaitForChild("PlayerGui")
local score = 0

-- Function to create a coin
local function createCoin()
    local coin = Instance.new("Part")
    coin.Size = Vector3.new(5, 5, 5)
    coin.Anchored = true
    coin.BrickColor = BrickColor.new("Bright yellow")
    coin.Position = Vector3.new(math.random(-50, 50), 5, math.random(-50, 50))
    coin.Parent = game.Workspace
    coin.Touched:Connect(function(hit)
        local character = hit.Parent
        if character:IsA("Model") and character:FindFirstChild("Humanoid") then
            score = score + 10
            coin:Remove()
            print("You collected a coin! Score: " .. score)
        end
    end)
end

-- Function to update the score display
local function updateScoreDisplay()
    local scoreLabel = playerGui:FindFirstChild("ScoreLabel")
    if scoreLabel then
        scoreLabel.Text = "Score: " .. score
    end
end

-- Main loop to create coins
while true do
    createCoin()
    wait(5) -- Create a new coin every 5 seconds
end

-- Create a UI to display the score
local scoreGui = Instance.new("ScreenGui")
scoreGui.Name = "ScoreGui"
local scoreLabel = Instance.new("TextLabel")
scoreLabel.Name = "ScoreLabel"
scoreLabel.Size = UDim2.new(0, 200, 0, 50)
scoreLabel.Position = UDim2.new(0.85, 0, 0.05, 0)
scoreLabel.BackgroundColor3 = Color3.new(0, 0, 0)
scoreLabel.TextColor3 = Color3.new(1, 1, 1)
scoreLabel.TextSize = 24
scoreLabel.Text = "Score: 0"
scoreLabel.Parent = scoreGui
scoreGui.Parent = playerGui

-- Initial update of the score display
updateScoreDisplay()
