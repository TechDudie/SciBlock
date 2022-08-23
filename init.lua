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
    silicon = "Silicon",
    pure_boron = "Pure Boron",
    pure_phosphorus = "Pure Phosphorus",
    silicon_panel = "Silicon Panel",
    silicon_wafer = "Silicon Wafer",
    semiconductor_n = "N-Type Doped Semiconductor",
    semiconductor_p = "P-Type Doped Semiconductor",
    transistor_npn = "NPN Transistor",
    transistor_pnp = "PNP Transistor"
}

for name, desc in pairs(item_data) do
    minetest.register_craftitem("sciblock:" .. name, {
        description = desc,
        inventory_image = "sciblock_" .. name .. ".png"
    })
end

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
        {"sciblock:silicon_wafer", "sciblock:pure_phosphorus", "sciblock:silicon_wafer"},
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