return {
  {
    "mbbill/undotree",
    enabled = true,
    config = function()
      vim.keymap.set("n", "<leader>u", "<CMD>UndotreeToggle<CR>")
    end,
  },
}
