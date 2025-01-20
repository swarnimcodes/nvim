return {
  "nvim-telescope/telescope.nvim",
  dependencies = {
    "nvim-lua/plenary.nvim",
    { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
  },
  opts = {},
  config = function()
    require("telescope").setup({
      defaults = {
        mappings = {
          i = {
            ["<C-h>"] = "which_key",
          },
        },
      },
      pickers = {},
      extensions = {
        fzf = {},
      },
    })
    require("telescope").load_extension("fzf")
    local builtin = require("telescope.builtin")
    vim.keymap.set("n", "<leader>f", builtin.find_files, {})
    vim.keymap.set("n", "<leader>b", builtin.buffers, {})
    vim.keymap.set("n", "<leader>d", builtin.diagnostics, {})
    vim.keymap.set("n", "<leader>/", builtin.live_grep, {})
  end,
}
