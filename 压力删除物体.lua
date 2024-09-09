local RunService = game:GetService("RunService")
local workspace = game:GetService("Workspace")
local Players = game:GetService("Players")

local objectsToDelete = {
    "EyefestationSpawn",
    "DesiredLocation",
    "Steam1",
    "Steam2",
    "Steam3",
    "Pandemonium",
    "Electricity",
    "BlockPart",
    "Steam",
    "Smoke"
}

local function deleteObject(obj)
    if obj and table.find(objectsToDelete, obj.Name) then
        RunService.Heartbeat:Wait()
        obj:Destroy()
    end
    
    if obj:IsA("RemoteEvent") and obj.Parent and obj.Parent.Name == "MainSearchlight" then
        RunService.Heartbeat:Wait()
        obj:Destroy()
    end
end

local function triggerRemoveParts(obj)
    if obj.Name == "RemoveParts" and obj.Parent and obj.Parent.Name == "Trickster" then
        obj:FireServer()
    end
end

local function deleteLopeeGUI()
    local player = Players.LocalPlayer
    if player and player.PlayerGui then
        local mainGui = player.PlayerGui:FindFirstChild("Main")
        if mainGui then
            local client = mainGui:FindFirstChild("Client")
            if client then
                local mainClient = client:FindFirstChild("MainClient")
                if mainClient then
                    local lopee = mainClient:FindFirstChild("Lopee")
                    if lopee then
                        RunService.Heartbeat:Wait()
                        lopee:Destroy()
                    end
                end
            end
        end
    end
end

workspace.DescendantAdded:Connect(function(descendant)
    deleteObject(descendant)
    triggerRemoveParts(descendant)
end)

for _, obj in ipairs(workspace:GetDescendants()) do
    deleteObject(obj)
    triggerRemoveParts(obj)
end

-- Delete the Lopee GUI
deleteLopeeGUI()
