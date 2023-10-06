--poke(0x5f2e,1)
cartdata "lzap_nightjanitor_1"
noop = function() end

scenes = {}
entities = {}
current_scene = nil

function _init()
	load_scene "level"
end

function _update()
	entity.all "update"
	current_scene:update()
end

function _draw()
	cls()
	entity.all "draw"
	current_scene:draw()
end

function load_scene(name)
	next_scene = scenes[name]

	if current_scene != next_scene then
		for entity in all(entity.pool) do
			entity:destroy()
		end

		current_scene = next_scene
		current_scene:init()
	end
	next_scene = nil
end
