local multiserver_compass = {}

local server_1_name = "Example1"
local server_1_img = "example1.png"

local server_2_name = "Example2"
local server_2_img = "example2.png"

local server_3_name = "Example3"
local server_3_img = "example3.png"

local server_4_name = "Example4"
local server_4_img = "example4.png"


multiserver_compass.fs = "size[2,2]" ..
"image_button[1,1;1,1;" .. server_1_img";".. server_1_name ..";" .. server_1_name .. "]" ..
"image_button[1,1;1,2;" .. server_2_img";".. server_2_name ..";" .. server_2_name .. "]" ..
"image_button[1,1;2,1;" .. server_3_img";".. server_3_name ..";" .. server_3_name .. "]" ..
"image_button[1,1;2,2;" .. server_4_img";".. server_4_name ..";" .. server_4_name .. "]" ..


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
