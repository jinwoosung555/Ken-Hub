local KenHub = Instance.new("ScreenGui")
local MainFrame = Instance.new("Frame")
local Title = Instance.new("TextLabel")
local UICorner = Instance.new("UICorner")
local UIListLayout = Instance.new("UIListLayout")

local function createToggle(name, callback)
    local Button = Instance.new("TextButton")
    Button.Name = name
    Button.Size = UDim2.new(1, 0, 0, 40)
    Button.BackgroundColor3 = Color3.fromRGB(45, 45, 45)
    Button.TextColor3 = Color3.fromRGB(255, 255, 255)
    Button.Text = name .. ": OFF"
    Button.Font = Enum.Font.SourceSansBold
    Button.TextSize = 16
    Button.Parent = MainFrame

    local toggled = false
    Button.MouseButton1Click:Connect(function()
        toggled = not toggled
        if toggled then
            Button.Text = name .. ": ON"
            Button.BackgroundColor3 = Color3.fromRGB(0, 170, 0)
        else
            Button.Text = name .. ": OFF"
            Button.BackgroundColor3 = Color3.fromRGB(45, 45, 45)
        end
        if callback then
            callback(toggled)
        end
    end)
end

KenHub.Name = "KenHub"
KenHub.Parent = game.CoreGui
KenHub.ResetOnSpawn = false

MainFrame.Name = "MainFrame"
MainFrame.Parent = KenHub
MainFrame.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
MainFrame.Position = UDim2.new(0.5, -125, 0.5, -150)
MainFrame.Size = UDim2.new(0, 250, 0, 300)
MainFrame.Active = true
MainFrame.Draggable = true

UICorner.CornerRadius = UDim.new(0, 8)
UICorner.Parent = MainFrame

Title.Name = "Title"
Title.Parent = MainFrame
Title.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
Title.Size = UDim2.new(1, 0, 0, 50)
Title.Font = Enum.Font.GothamBold
Title.Text = "Ken Hub | Blox Fruits"
Title.TextColor3 = Color3.fromRGB(255, 255, 255)
Title.TextSize = 18

local TitleCorner = Instance.new("UICorner")
TitleCorner.CornerRadius = UDim.new(0, 8)
TitleCorner.Parent = Title

UIListLayout.Parent = MainFrame
UIListLayout.SortOrder = Enum.SortOrder.LayoutOrder
UIListLayout.Padding = UDim.new(0, 5)

createToggle("Auto Farm Level", function(state)
    _G.AutoFarm = state
    task.spawn(function()
        while _G.AutoFarm do
            task.wait(1)
            print("Auto Farm Level Active...")
        end
    end)
end)

createToggle("Auto Stats", function(state)
    _G.AutoStats = state
    task.spawn(function()
        while _G.AutoStats do
            task.wait(1)
            print("Auto Stats Active...")
        end
    end)
end)

createToggle("Teleport System", function(state)
    _G.TeleportSystem = state
    print("Teleport System toggled:", state)
end)

createToggle("Boss Notifier", function(state)
    _G.BossNotifier = state
    print("Boss Notifier toggled:", state)
end)

createToggle("Devil Fruit Finder", function(state)
    _G.FruitFinder = state
    print("Devil Fruit Finder toggled:", state)
end)
