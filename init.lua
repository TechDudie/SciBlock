print("Registering logging function for SciBlock")
function log(text, level) -- Log function
    if level == nil then
        level = "INFO"
    end
    print("[sciblock] [" .. level .. "] " .. text)
end
log("Registered")

log("Defining item data")
item_data =
{
    battery = "Battery",
    computer_broken = "Broken Computer",
    computer = "Computer",
    scrap_metal = "Scrap Metal",
    motor = "Motor",
    chip_gold = "CPU",
    chip_silver = "RAM",
    cd = "CD",
    usb_drive = "USB Drive",
    metal_sheet = "Metal Sheet",
    metal_wire = "Metal Wire",
    copper_sheet = "Copper Sheet",
    copper_wire = "Copper Wire",
    fiberglass = "Fiberglass",
    silicon = "Pure Silicon",
    pure_carbon = "Pure Carbon",
    pure_boron = "Pure Boron",
    pure_phosphorus = "Pure Phosphorus",
    silicon_panel = "Silicon Panel",
    silicon_wafer = "Silicon Wafer",
    semiconductor_n = "N-Type Doped Semiconductor",
    semiconductor_p = "P-Type Doped Semiconductor",
    transistor_npn = "NPN Transistor",
    transistor_pnp = "PNP Transistor",
    ceramic_plate = "Ceramic Plate",
    resistor = "Resistor",
    bottle_sap = "Pine Sap",
    bottle_oil = "Oil",
    plastic_sheet = "Plastic Sheet"
}

log("Registering items")
for name, desc in pairs(item_data) do
    minetest.register_craftitem("sciblock:" .. name, {
        description = desc,
        inventory_image = "sciblock_" .. name .. ".png"
    })
end

log("Registering crafts")
minetest.register_craft({
    output = "default:steel_ingot",
    recipe = {
        {"sciblock:metal_sheet"},
        {"sciblock:metal_sheet"},
        {"sciblock:metal_sheet"}
    }
})

minetest.register_craft({
    output = "sciblock:metal_wire 5",
    recipe = {
        {"sciblock:metal_sheet"}
    }
})

minetest.register_craft({
    output = "sciblock:copper_sheet 3",
    recipe = {
        {"default:copper_ingot"}
    }
})

minetest.register_craft({
    output = "sciblock:copper_wire 5",
    recipe = {
        {"sciblock:copper_sheet"}
    }
})

minetest.register_craft({
    output = "sciblock:silicon_panel",
    recipe = {
        {"sciblock:fiberglass", "sciblock:fiberglass", "sciblock:fiberglass"},
        {"sciblock:copper_sheet", "sciblock:copper_sheet", "sciblock:copper_sheet"},
        {"sciblock:silicon_wafer", "sciblock:silicon_wafer", "sciblock:silicon_wafer"}
    }
})

minetest.register_craft({
    output = "sciblock:semiconductor_n",
    recipe = {
        {"sciblock:pure_phosphorus", "sciblock:silicon_wafer", "sciblock:pure_phosphorus"},
        {"sciblock:silicon_wafer", "sciblock:pure_phosphorus", "sciblock:silicon_wafer"},
        {"sciblock:pure_phosphorus", "sciblock:silicon_wafer", "sciblock:pure_phosphorus"}
    }
})

minetest.register_craft({
    output = "sciblock:semiconductor_p",
    recipe = {
        {"sciblock:pure_boron", "sciblock:silicon_wafer", "sciblock:pure_boron"},
        {"sciblock:silicon_wafer", "sciblock:pure_boron", "sciblock:silicon_wafer"},
        {"sciblock:pure_boron", "sciblock:pure_boron", "sciblock:pure_boron"}
    }
})

minetest.register_craft({
    output = "sciblock:transistor_npn",
    recipe = {
        {"sciblock:semiconductor_n", "sciblock:semiconductor_p", "sciblock:semiconductor_n"},
        {"sciblock:metal_wire", "", "sciblock:metal_wire"}
    }
})

minetest.register_craft({
    output = "sciblock:transistor_pnp",
    recipe = {
        {"sciblock:semiconductor_p", "sciblock:semiconductor_n", "sciblock:semiconductor_p"},
        {"sciblock:metal_wire", "", "sciblock:metal_wire"}
    }
})

minetest.register_craft({
    output = "sciblock:resistor",
    recipe = {
        {"", "sciblock:ceramic_plate", ""},
        {"sciblock:metal_wire", "sciblock:pure_carbon", "sciblock:metal_wire"},
        {"sciblock:metal_wire", "sciblock:ceramic_plate", "sciblock:metal_wire"}
    }
})

minetest.register_craft({
    output = "sciblock:workspace",
    recipe = {
        {"dye:dark_green", "sciblock:plastic_sheet", "dye:white"},
        {"default:steelblock", "default:diamondblock", "default:steelblock"},
        {"default:obsidian", "default:obsidian", "default:obsidian"}
    }
})

minetest.register_craft({
    output = "sciblock:bottle_sap",
    recipe = {
        {"", "vessels:glass_bottle", ""},
        {"default:pine_needles", "default:pine_needles", "default:pine_needles"},
        {"default:pine_needles", "default:pine_needles", "default:pine_needles"}
    }
})

-- Cooking recipes

minetest.register_craft({
    type = "cooking",
    output = "sciblock:fiberglass",
    recipe = "default:glass",
    cooktime = 5
})

minetest.register_craft({
    type = "cooking",
    output = "sciblock:metal_sheet",
    recipe = "sciblock:scrap_metal",
    cooktime = 5
})

minetest.register_craft({
    type = "cooking",
    output = "sciblock:ceramic_plate",
    recipe = "default:clay",
    cooktime = 5
})

minetest.register_craft({
    type = "cooking",
    output = "sciblock:bottle_oil",
    recipe = "sciblock:bottle_sap",
    cooktime = 9
})

minetest.register_craft({
    type = "cooking",
    output = "sciblock:plastic_sheet",
    recipe = "sciblock:bottle_oil",
    cooktime = 9,
    replacements = {{"sciblock:bottle_oil", "vessels:glass_bottle"}}
})

log("Registering nodes")
minetest.register_node("sciblock:terminal", {
    description = "Terminal",
    tiles = {
        "sciblock_terminal_side2.png",
        "sciblock_terminal_side2.png",
        "sciblock_terminal_side.png",
        "sciblock_terminal_side.png",
        "sciblock_terminal_back.png",
        "sciblock_terminal_front.png",
    },
    groups = {oddly_breakable_by_hand = 1},
})

log("Registering workspace (WIP)")
workspace_data = {};

-- HEY YOU CHEATER! FIGURE THE RECIPES OUT YOURSELVES!
workspace_data["sciblock:chip_gold"] = {
    "sciblock:transistor_npn", "sciblock:transistor_npn", "sciblock:transistor_npn", "sciblock:transistor_npn", "sciblock:transistor_npn",
    "sciblock:transistor_npn", "sciblock:transistor_pnp", "sciblock:transistor_npn", "sciblock:transistor_pnp", "sciblock:transistor_npn",
    "sciblock:transistor_npn", "sciblock:transistor_npn", "sciblock:silicon_panel",  "sciblock:transistor_npn", "sciblock:transistor_npn",
    "sciblock:transistor_npn", "sciblock:transistor_pnp", "sciblock:transistor_npn", "sciblock:transistor_pnp", "sciblock:transistor_npn",
    "sciblock:transistor_npn", "sciblock:transistor_npn", "sciblock:transistor_npn", "sciblock:transistor_npn", "sciblock:transistor_npn"
}

workspace_data["sciblock:chip_silver"] = {
    "", "", "", "", "",
    "", "sciblock:transistor_npn", "sciblock:transistor_npn", "sciblock:transistor_npn", "",
    "", "sciblock:transistor_npn", "sciblock:silicon_panel",  "sciblock:transistor_npn", "",
    "", "sciblock:transistor_npn", "sciblock:transistor_npn", "sciblock:transistor_npn", "",
    "", "", "", "", ""
}

local string = ""
for output, recipe in pairs(workspace_data) do
    string = ""
    for id, item in pairs(recipe) do
        string = string .. "ItemStack(\"" .. tostring(item) .. "\")"
    end
    workspace_data[output] = string
end

minetest.register_node("sciblock:workspace", {
    description = "Workspace",
    tiles = {
        "sciblock_workspace_top.png",
        "sciblock_workspace_side.png",
        "sciblock_workspace_side.png",
        "sciblock_workspace_side.png",
        "sciblock_workspace_side.png",
        "sciblock_workspace_side2.png",
    },
    groups = {choppy = 3, oddly_breakable_by_hand = 1},
    after_place_node = function(pos, placer)
        local meta = minetest.get_meta(pos)
        meta:set_string("infotext", "Workspace")
        meta:set_string("formspec",
            "formspec_version[6]" ..
            "size[10.25,12]" ..
            "list[context;main;0.25,0.25;5,5]" ..
            "list[context;preview;7.75,2.75;1,1]" ..
            "list[current_player;main;0.25,7;8,4]" ..
            "label[6.5,0.4;Workspace]" ..
            "label[7.75,2.5;Result]" ..
            "button[6.75,5.25;3,1;craft;Craft!]"
        )
        local inv = meta:get_inventory()
        inv:set_size("main", 25)
        local prev = meta:get_inventory()
        inv:set_size("preview", 1)
end,
    on_receive_fields = function(pos, formname, fields, player)
        if fields.quit then
            return
        end
        if fields.craft then
            local meta = minetest.get_meta(pos)
            local inv = meta:get_inventory()
            local invlist = inv:get_list("main")
            local prev = meta:get_inventory()
            local filter_string = ""
            for id, item  in pairs(invlist) do
                filter_string = filter_string .. tostring(item)
            end
            local result = ""
            for output, recipe in pairs(workspace_data) do
                if filter_string == recipe then
                    result = output
                end
            end
            if result ~= "" then
                local crafted = ItemStack(result)
                local leftover = prev:add_item("preview", crafted)
                if leftover:get_count() > 0 then
                    goto full_inventory
                end
                inv:set_list("main", {})
            end
            ::full_inventory::
        end
    end
})

log("Mod loaded")
