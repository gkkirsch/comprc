require("sidebar-nvim").setup({
    disable_default_keybindings = 0,
    bindings = nil,
    open = true,
    side = "left",
    initial_width = 25,
    hide_statusline = true,
    update_interval = 1000,
    sections = { "datetime", "git", "files", "diagnostics" },
    section_separator = {"", "-----", ""},
    containers = {
        attach_shell = "/bin/sh", show_all = true, interval = 5000,
    },
    datetime = { format = "%a %b %d, %H:%M", clocks = { { name = "local" } } },
    disable_closing_prompt = false,
    files = {
        icon = "",
        show_hidden = false,
        ignored_paths = {"%.git$"}
    },
    symbols = {
        icon = "ƒ",
    }
})
