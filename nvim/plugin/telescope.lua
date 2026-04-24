require("telescope").setup({
    defaults = {
        vimgrep_arguments = {
            "rg",
            "--color=never",
            "--no-heading",
            "--with-filename",
            "--line-number",
            "--column",
            "--smart-case",
            "--hidden",
            "--glob",
            "!**/.git/*",
        },
        sorting_strategy = "ascending",
        layout_strategy = "vertical",
        layout_config = {
            vertical = {
                width = { padding = 0 },
                height = { padding = 0 },
                prompt_position = "top",
                preview_cutoff = 0,
                preview_height = 0.5,
                preview_width = 1.0,
                mirror = true,
            },
        },
        initial_mode = "normal",
        path_display = {
            "truncate",
        },
        mappings = {
            i = {
                ["<C-u>"] = false,
                ["<C-d>"] = false,
            },
            n = {
                ["K"] = require("telescope.actions.layout").toggle_preview,
                ["dd"] = require("telescope.actions").delete_buffer,
            },
        },
        preview = {
            timeout_ms = 3000,
        },
    },
    pickers = {
        buffers = {
            sort_mru = true,
        },
        find_files = {
            hidden = true,
        },
    },
})

vim.keymap.set("n", "<leader>?", "<cmd>Telescope oldfiles<cr>", { desc = "[?] Find recently opened files" })
vim.keymap.set("n", "<leader>k", "<cmd>Telescope keymaps<cr>", { desc = "[k] Search Keymaps" })
vim.keymap.set("n", "<leader><space>", "<cmd>Telescope buffers<cr>", { desc = "[ ] Find existing buffers" })
vim.keymap.set("n", "<leader>gf", "<cmd>Telescope git_files<cr>", { desc = "Search Git Files" })
vim.keymap.set("n", "<leader>sf", "<cmd>Telescope find_files<cr>", { desc = "Search Files" })
vim.keymap.set("n", "<leader>sh", "<cmd>Telescope help_tags<cr>", { desc = "Search Help" })
vim.keymap.set("n", "<leader>sw", "<cmd>Telescope grep_string<cr>", { desc = "Search current Word" })
vim.keymap.set("n", "<leader>sg", "<cmd>Telescope live_grep<cr>", { desc = "Search by Grep" })
vim.keymap.set("n", "<leader>sd", "<cmd>Telescope diagnostics<cr>", { desc = "Search Diagnostics" })
vim.keymap.set("n", "<leader>/", function()
  require("telescope.builtin").current_buffer_fuzzy_find(
    require("telescope.themes").get_dropdown({
      winblend = 10,
      previewer = false,
    })
  )
end, { desc = "[/] Fuzzily search in current buffer" })
