local multiserver_compass = {}

local n_servers = 4--default, max is 4

local fs_size
if n_servers == 1 then
	fs_size = "1,1"
elseif n_servers == 2 then
	fs_size = "1,2"
elseif n_servers == 3 or n_servers == 4 then
	fs_size = "2,2"
end

local server_1_name = "Example1"
local server_1_img = "example1.png"

if n_servers == 2 then
	local server_2_name = "Example2"
	local server_2_img = "example2.png"
elseif n_servers == 3 then
	local server_2_name = "Example2"
	local server_2_img = "example2.png"

	local server_3_name = "Example3"
	local server_3_img = "example3.png"
elseif n_servers == 4 then
	local server_2_name = "Example2"
	local server_2_img = "example2.png"

	local server_3_name = "Example3"
	local server_3_img = "example3.png"

	local server_4_name = "Example4"
	local server_4_img = "example4.png"
end


multiserver_compass.fs = "size[" .. fs_size .. "]" ..
"image_button[1,1;1,1;" .. server_1_img";".. server_1_name ..";" .. server_1_name .. "]"

if n_servers == 2 then
	multiserver_compass.fs = multiserver_compass.fs .. "image_button[1,1;1,2;" .. server_2_img";".. server_2_name ..";" .. server_2_name .. "]"
elseif n_servers == 3 then
	multiserver_compass.fs = multiserver_compass.fs .. "image_button[1,1;1,2;" .. server_2_img";".. server_2_name ..";" .. server_2_name .. "]" ..
	"image_button[1,1;2,1;" .. server_3_img";".. server_3_name ..";" .. server_3_name .. "]"
elseif n_servers == 4 then
	multiserver_compass.fs = multiserver_compass.fs .. "image_button[1,1;1,2;" .. server_2_img";".. server_2_name ..";" .. server_2_name .. "]" ..
	"image_button[1,1;2,1;" .. server_3_img";".. server_3_name ..";" .. server_3_name .. "]" ..
	"image_button[1,1;2,2;" .. server_4_img";".. server_4_name ..";" .. server_4_name .. "]"
end

minetest.register_craftitem("multiserver_compass:compass", {
	description = "Multiserver compass",
	inventory_image = "multiserver_compass.png",
 
	on_use = function(itemstack, user, pointed_thing)
		minetest.show_formspec(user:get_player_name, "multiserver_compass:redirect", multiserver_compass.fs)
	end,
})

minetest.register_on_player_receive_fields(function(player, formname, fields)
	if formname == "multiserver_compass:redirect" then -- This is your form name
		local pname = player:get_player_name()
		if fields.example1 then
			multiserver.redirect(pname, "Example1")
		end
		if n_servers == 2 then
			if fields.example2 then
				multiserver.redirect(pname, "Example2")
			end
		elseif n_servers == 3 then
			if fields.example2 then
				multiserver.redirect(pname, "Example2")
			elseif fields.example3 then
				multiserver.redirect(pname, "Example3")
			end
		elseif n_servers == 4 then
			if fields.example2 then
				multiserver.redirect(pname, "Example2")
			elseif fields.example3 then
				multiserver.redirect(pname, "Example3")
			elseif fields.example4 then
				multiserver.redirect(pname, "Example4")
			end
		end
	end
end)
