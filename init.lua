local multiserver_compass = {}

multiserver_compass.fs

minetest.register_craftitem("multiserver_compass:compass", {
	description = "Multiserver compass",
	inventory_image = "multiserver_compass.png",
 
	on_use = function(itemstack, user, pointed_thing)
		minetest.show_formspec(user:get_player_name, "multiserver_compass:redirect", multiserver_compass.fs)
	end,
})

minetest.register_on_player_receive_fields(function(player, formname, fields)
	if formname == "multiserver_compass:redirect" then -- This is your form name
		print("Player "..player:get_player_name().." submitted fields "..dump(fields))
	end
end)
