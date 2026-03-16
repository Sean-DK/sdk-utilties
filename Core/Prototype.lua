-- Pulled this code from DBM-Core PrototypeRegistry.lua
local _, private = ...

local prototypes = {}

function private:GetPrototype(name)
	local prototype = prototypes[name] or {}
	prototypes[name] = prototype
	return prototype
end