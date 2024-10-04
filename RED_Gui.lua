local buttons = {
    {name = "Build A Boat", url = "https://raw.githubusercontent.com/catblox1346/StensUIReMake/main/Script/StensUIRemakev1.0.0"},
    {name = "Doors", url = "https://raw.githubusercontent.com/notpoiu/mspaint/main/main.lua"},
    {name = "Fly Gui", url = "https://rawscripts.net/raw/Universal-Script-FLY-GUI-V3-18636"},
    {name = "Mobile Keyboard", url = "https://rawscripts.net/raw/Universal-Script-Mobile-keyboard-6975"}
}

for i, buttonInfo in ipairs(buttons) do
    local button = Instance.new("TextButton", frame)
    button.Size = UDim2.new(0, 80, 0, 50)
    button.Position = UDim2.new(0.5, -40, 0, 70 + (i - 1) * 60)
    button.TextColor3 = Color3.fromRGB(255, 255, 255)
    button.BackgroundColor3 = Color3.fromRGB(255, 0, 0)
    button.Font = Enum.Font.SourceSansBold
    button.TextScaled = true
    button.Text = buttonInfo.name
    Instance.new("UICorner", button).CornerRadius = UDim.new(0, 15)

    button.MouseButton1Click:Connect(function()
        createConfirmation("Deseja executar " .. buttonInfo.name .. "?", function()
            local countdownGui = Instance.new("ScreenGui", player:WaitForChild("PlayerGui"))
            local countdownFrame = Instance.new("Frame", countdownGui)
            countdownFrame.Size = UDim2.new(0, 150, 0, 75)
            countdownFrame.Position = UDim2.new(0.5, -75, 0.5, -37.5)
            countdownFrame.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
            Instance.new("UICorner", countdownFrame).CornerRadius = UDim.new(0, 15)

            local countdownLabel = Instance.new("TextLabel", countdownFrame)
            countdownLabel.Size = UDim2.new(1, 0, 1, 0)
            countdownLabel.BackgroundTransparency = 1
            countdownLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
            countdownLabel.Font = Enum.Font.SourceSansBold
            countdownLabel.TextScaled = true

            for count = 3, 1, -1 do
                countdownLabel.Text = tostring(count)
                wait(1)
            end
            countdownGui:Destroy()
            loadstring(game:HttpGet(buttonInfo.url))()
        end)
    end)
end
