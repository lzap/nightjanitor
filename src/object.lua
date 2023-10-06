object = {
	new = function(self, table)
		return self:constructor(table)
	end,

	constructor = function(self, table)
		self.__index = self
		return setmetatable(table or {}, self)
	end,

	init = noop,
	update = noop,
	draw = noop
}
