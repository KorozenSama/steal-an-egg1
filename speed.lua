local speedPad = script.Parent
local boostAmount = 50 -- How much faster the player goes
local duration = 4 -- Boost duration in seconds
local active = false

local function onTouch(otherPart)
	local character = otherPart.Parent
	local humanoid = character:FindFirstChildOfClass("Humanoid")
	
	if humanoid and not active then
		active = true
		
		-- Store original speed (default is 16)
		local originalSpeed = humanoid.WalkSpeed
		humanoid.WalkSpeed = originalSpeed + boostAmount
		
		task.wait(duration)
		
		-- Reset back to safe limits
		if humanoid then
			humanoid.WalkSpeed = originalSpeed
		end
		active = false
	end
end

speedPad.Touched:Connect(onTouch)
