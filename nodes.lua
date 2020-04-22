local preserve_metadata = function (pos, oldnode, oldmeta, drops)
	local new = ItemStack(oldnode)
	local banner_string = minetest.get_meta(pos):get_string("banner")
	new:get_meta():set_string("banner", banner_string)
	if drops and drops[1] then
		drops[1] = new
	end
end

-- da wooden banner
minetest.register_node("banners:wooden_banner",
    {
        drawtype = "mesh",
        mesh = "banner_support.x",
        tiles = {"banner_support.png"},
        description = "Wooden banner",
        groups = {choppy=2, dig_immediate=2},
        diggable = true,
        stack_max = 1,
        paramtype="light",
        paramtype2="facedir",
        after_place_node = function (pos, player, itemstack, pointed_thing)
            banners.banner_after_place(pos, player, itemstack, pointed_thing)
          end,
        on_destruct = function(pos)
            banners.banner_on_destruct(pos)
        end,
        on_use = function(i, p, pt)
            banners.banner_on_use(i, p, pt)
        end,
		preserve_metadata = function(pos, oldnode, oldmeta, drops)
			preserve_metadata(pos, oldnode, oldmeta, drops)
		end
    }
)

-- steel banner
minetest.register_node("banners:steel_banner",
    {
        drawtype = "mesh",
        mesh = "banner_support.x",
        tiles = {"steel_support.png"},
        description = "Steel banner",
        groups = {cracky=2},
        diggable = true,
        stack_max = 1,
        paramtype = "light",
        paramtype2 = "facedir",
        after_place_node = function (pos, player, itemstack, pointed_thing)
            banners.banner_after_place(pos, player, itemstack, pointed_thing)
          end,
        on_destruct = function(pos)
            banners.banner_on_destruct(pos)
        end,
        on_use = function(i, p, pt)
            banners.banner_on_use(i, p, pt)
        end,
		preserve_metadata = function(pos, oldnode, oldmeta, drops)
			preserve_metadata(pos, oldnode, oldmeta, drops)
		end

    }
)

