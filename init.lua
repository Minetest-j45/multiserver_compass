local multiserver_compass = {}

local server_1_name = "Example"
local server_1_img = "example.png"

multiserver_compass.fs = "size[4,4]" ..
"image_button[1,1;1,1;" .. server_1_img";".. server_1_name ..";" .. server_1_name .. "]"

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
