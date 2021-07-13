local mod = RegisterMod("Crafting Bag Help", 1)
local json = require("json");
local weed = true; --always weed shit
function mod:HookCmd(cmd, text) --cmd is the text before the space, text is the args after
	if cmd == "escape" then
		Game():Fadeout(1,2);
	end
	if cmd == "lu" then
		load("print("..text..");")();
	end
end


function PrintRecursively(target)
	aaa = "";
	for k,v in pairs(target) do
		aaa = aaa .. tostring(k) .. "  : " .. tostring(type(v)) .. "\n";
		if type(v) == "table" and b ~= "__class" then
			for b,m in pairs(v) do
				aaa = aaa .. "\t ->" .. tostring(b) .. "  : " .. tostring(type(m)) .. "\n";
				if type(m) == "table" and b ~= "__class" then
					for y,u in pairs(m) do
						aaa = aaa .. "\t \t->" .. tostring(y) .. " : " .. tostring(type(u)).."\n";
					end
				end
			end
		end
	end
	mod:SaveData(aaa);
end

mod:AddCallback(ModCallbacks.MC_EXECUTE_CMD, mod.HookCmd);	

