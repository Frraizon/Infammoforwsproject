local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")

task.wait(0.1)

local Configurations = ReplicatedStorage:WaitForChild("Configurations")

local function giveInfiniteAmmo(character)
    if not Configurations then return end
    for _, tool in pairs(Configurations.ACS_Guns:GetChildren()) do
        if tool:FindFirstChild("Ammo") then
            tool.Ammo.Value = math.huge
        end
    end
end

local function onPlayerAdded(player)
    player.CharacterAdded:Connect(function(character)
        task.wait(0.5) 
        giveInfiniteAmmo(character)
    end)
end

for _, player in pairs(Players:GetPlayers()) do
    onPlayerAdded(player)
end

Players.PlayerAdded:Connect(onPlayerAdded)
