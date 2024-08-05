script.on_event(defines.events.on_entity_settings_pasted, function(event)
	local source = event.source
	local destination = event.destination

	if (source.name == destination.name or source.prototype.fast_replaceable_group == destination.prototype.fast_replaceable_group)	and source.supports_direction and destination.supports_direction and source.type ~= 'transport-belt' then
		local destination_box = destination.bounding_box
		
		local ltx = destination_box.left_top.x
		local lty = destination_box.left_top.y
		local rbx = destination_box.right_bottom.x
		local rby = destination_box.right_bottom.y
		
		local old_direction = destination.direction
		destination.direction = source.direction
		
		destination_box = destination.bounding_box
		
		if ltx ~= destination_box.left_top.x or lty ~= destination_box.left_top.y or rbx ~= destination_box.right_bottom.x or rby ~= destination_box.right_bottom.y then
			destination.direction = old_direction
		end
	end
end)