local player = game.Players.LocalPlayer -- Get the local player
local chatService = game:GetService("Chat") -- Get the chat service
local chatLimit = 15 -- Number of allowed messages before warning
local healthLossTrigger = 3 -- Number of 'E's in a sentence to trigger health loss
local healthLossAmount = 69 -- Amount of health to lose

local messageCount = 0

chatService:RegisterChatCallback(Enum.ChatCallbackType.OnCreatingChatMessage, function(message)
    if player and messageCount >= chatLimit then
        warn("Please be quiet!")
        return true -- Block the message
    else
        messageCount = messageCount + 1
    end

    local sentence = message
    local eCount = 0
    for char in sentence:gmatch("[eE]") do
        eCount = eCount + 1
    end

    if eCount >= healthLossTrigger then
        -- Apply health loss here (assuming the player's health is stored in a variable called "health")
        player:TakeDamage(healthLossAmount)
        warn("You lost " .. healthLossAmount .. " health for using too many E's!")
    end

    return false -- Allow the message to be sent
end)
