local border = Instance.new("ScreenGui")
local Frame0 = Instance.new("Frame")
local Frame_2 = Instance.new("Frame")
local Frame_3 = Instance.new("Frame")

border.Name = "border"
border.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")
border.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
border.ScreenInsets = Enum.ScreenInsets.None

Frame0.Parent = border
Frame0.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
Frame0.Size = UDim2.new(1702, 0, 0, 129)

Frame_2.Parent = border
Frame_2.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
Frame_2.Position = UDim2.new(0, 0, 0.851382494, 0)
Frame_2.Size = UDim2.new(1702, 0, 129, 0)
Frame_3.Parent = border
Frame_3.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
Frame_3.Size = UDim2.new(1, 0, 1, 0)
wait(1)

local tweensevice = game:GetService("TweenService")
local tweeninfo = TweenInfo.new(5, Enum.EasingStyle.Quint, Enum.EasingDirection.Out)

local goal = {Transparency = 1}

local tween = tweensevice:Create(Frame_3, tweeninfo, goal):Play()

local function sky(fov, timeofday, sunid)
	game.Workspace.CurrentCamera.FieldOfView = fov
	game.Lighting.TimeOfDay = timeofday
	local blm = game.Lighting:FindFirstChildOfClass("BloomEffect")
	if blm then
		blm.Enabled = false
	else
		print("no blm")
	end
	
	game.Lighting.Sky.SunTextureId = sunid
	game.Lighting.Sky.CelestialBodiesShown = true
	local DOF = game.Lighting:FindFirstChildOfClass("DepthOfFieldEffect")
	local s = {Enabled = true, FarIntensity = 0.27, FocusDistance = 0, InFocusRadius = 50, NearIntensity = 1}
	if DOF then
		for p01, value01 in pairs(s) do
			DOF[p01] = value01
		end
	end
	
	if not DOF then
		local dof = Instance.new("DepthOfFieldEffect", game.Lighting)
		for p001, value001 in pairs(s) do
			dof[p001] = value001
		end
	end
	
	local sunray = game.Lighting:FindFirstChildOfClass("SunRaysEffect")
	local r = {Enabled = true, Intensity = 0.009, Spread = 0.1}
	if sunray then
		for p2, value2 in pairs(r) do
			sunray[p2] = value2
		end
	end
	
	if not sunray then
		local sr = Instance.new("SunRaysEffect", game.Lighting)
		for p1, value1 in pairs(r) do
			sr[p1] = value1
		end
	end
	
	local CCEffect = game.Lighting:FindFirstChildOfClass("ColorCorrectionEffect")
	if not CCEffect then
		local cceffect = Instance.new("ColorCorrectionEffect", game.Lighting)
		cceffect.TintColor = Color3.fromRGB(255, 199, 143)
	end
	CCEffect.TintColor = Color3.fromRGB(255, 199, 143)
end

sky(60, -- fov
	"-06:42:26", -- time
	"rbxassetid://12483779678" -- sun texture id
)
