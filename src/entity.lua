entity = object:new({
	type = "entity",
	pool = {},

	new = function(self, table)
		local new_entity = self:constructor(table)
		new_entity:init()
		add(self.pool, new_entity)
		return new_entity
	end,

	destroy = function(self)
		if self.on_destroy then
			self:on_destroy()
		end
		del(entity.pool, self)
	end,

	on_destroy = noop,

	all = function(method)
		for entity in all(entity.pool) do
			entity["_"..method](entity)
		end
	end,

	_update = function(self)
		self:update()
	end,

	_draw = function(self)
		self:draw()
	end
})
